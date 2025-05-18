{
  # User account
   users.users.Gen-Kn = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "render" ];
    uid = 1000;
  };
}
