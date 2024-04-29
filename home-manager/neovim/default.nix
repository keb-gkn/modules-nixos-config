{
  inputs,
  outputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      # base distro
      nvchad
      nvchad-ui

      lazy-nvim
      indent-blankline-nvim
      null-ls-nvim
      nvim-colorizer-lua
      nvim-lspconfigig
      nvim-lsp-notify
      nvim-lsputils
      nvim-tree-lua
      nvim-treesitter
      nvim-web-devicons
      comment-nvim
      luasnip
      base46
      better-escape-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-path
      friendly-snippets
      gitsigns-nvim
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-cmp
      nvim-autopairs
      nvterm
      plenary-nvim
      telescope-nvim
      telescope-dap-nvim
      telescope-fzf-writer-nvim
      telescope-fzf-native-nvim
      telescope-media-files-nvim
      telescope-file-browser-nvim
      telescope-ui-select

      onenord-nvim

      statix
    ];

    extraPackages = with pkgs; [
      libgcc # needed for nvim-treesitter
      libclang
      lua-language-server

      # HTML, CSS, JSON
      vscode-langservers-extracted

      # LazyVim defaults
      stylua
      shfmt

      # Linter
      nil

      # Telescope
      ripgrep
      ffmpegthumbnailer

      # Markdown extra
      nodePackages.markdownlint-cli
      marksman

      # JSON and YAML extras
      nodePackages.yaml-language-server

      # Custom
      editorconfig-checker
      shellcheck

      # Pazzaz
      nerdfonts
      chafa

      # NIX
      statix
    ];

    configure = {
      customRC = ''
        set runtimepath^=${./.}
        source ${./.}init.lua
      '';

      wrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${lib.makeBinPath config.programs.neovim.extraPackages}"
      ];
    };

  };

  #xdg.configFile."nvim/lua" = {
  #  recursive = true;
  #  source = ./lua;
  #};
}

