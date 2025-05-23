{

  catppuccin = {
    enable = true;
    flavor = "frappe";
   };

  catppuccin.pointerCursor = {
    enable = true;
    flavor = "frappe";
   };

  colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavor = "frappe";
        integrations = {
          notify = true;
          neotree = true;
          treesitter = true;
          treesitter_context = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    catppuccin = {
      enable = true;
      flavor = "frappe";
    };
  };
}
