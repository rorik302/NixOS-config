{
  config,
  pkgs,
  lib,
  pkgs-unstable,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config/configs";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    tree-sitter
    gcc
    lua-language-server
    marksman
    basedpyright
    stylelint
    hadolint
    htmlhint
    eslint_d
    markdownlint-cli
    selene
    mypy
    ruff
    tombi
    yamllint
    prettierd
    kdlfmt
    stylua
    nixfmt
    nginx-config-formatter
    black
    libgit2
  ];

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
    recursive = true;
  };
}
