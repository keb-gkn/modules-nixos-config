{

  catppuccin = {
    enable = true;
    flavor = "frappe";
   };

  catppuccin.pointerCursor = {
    enable = true;
    flavor = "frappe";
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
