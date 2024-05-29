{ lua, luaPackages, callPackage, ... }:

assert lua.luaversion == luaPackages.lua.luaversion;

rec {

  dbus_proxy = callPackage ./dbus_proxy {
    inherit (luaPackages) lgi buildLuaPackage;
  };

  enum = callPackage ./enum {
    inherit (luaPackages) buildLuaPackage;
  };

  pulseaudio_dbus = callPackage ./pulseaudio_dbus {
    inherit dbus_proxy;
    inherit (luaPackages) buildLuaPackage;
  };

  upower_dbus = callPackage ./upower_dbus {
    inherit dbus_proxy enum;
    inherit (luaPackages) buildLuaPackage;
  };
}
