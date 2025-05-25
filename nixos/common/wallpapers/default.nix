with builtins;

let
  dir = "/etc/nixos/common/wallpapers";
in
import ./aenami ++ [
    "${dir}/abandoned_satellite_dishes.jpg"
    "${dir}/escaping_the_well.jpg"
    "${dir}/fedex_cargo_ship.jpg"
    "${dir}/ghost_in_the_shell.jpg"
    "${dir}/the_neon_shallows.png"
    "${dir}/the_wormworld_saga_edited.jpg"
]
