local function augroup(name, clear)
	local clear_opt = clear or true
	return vim.api.nvim_create_augroup("User_" .. name, { clear = clear_opt })
end

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("LastCursorPosition"),
	callback = function(event)
		local exclude = { "gitcommit", "commit", "gitrebase" }
		if vim.tbl_contains(exclude, vim.bo[event.buf].filetype) then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
		local lcount = vim.api.nvim_buf_line_count(event.buf)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("Filetype", {
	desc = "Убирает автоматические комментарии при переходе на новую строку",
	pattern = "*",
	callback = function() vim.opt_local.formatoptions:remove({ "r", "o" }) end,
})
