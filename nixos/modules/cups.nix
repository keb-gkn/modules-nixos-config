{ config, ... }:
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = false;
    browsed.enable = config.services.priting.enable;
    drivers = [ ];
  };
}
