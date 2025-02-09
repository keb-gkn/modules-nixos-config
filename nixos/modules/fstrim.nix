{ lib, config, ... }:

{
    services.fstrim = {
      enable = true;
      interval = "daily";
    };
}
