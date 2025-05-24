{pkgs, ...}: {

 programs.vscode = {
     enable = true;
     profiles.default.extensions = with pkgs.vscode-extensions; [
       catppuccin.catppuccin-vsc
       catppuccin.catppuccin-vsc-icons
       streetsidesoftware.code-spell-checker
       dbaeumer.vscode-eslint
       esbenp.prettier-vscode
       vscodevim.vim
       rust-lang.rust-analyzer
       haskell.haskell
       davidanson.vscode-markdownlint
       elmtooling.elm-ls-vscode
       unifiedjs.vscode-mdx
    ];
  };
}
