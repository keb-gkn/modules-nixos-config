{pkgs, ...}: {
  qt = {
    enable = true;
    style = {
      name = "Nordic";
      package = pkgs.nordic;
    };
  };
}
