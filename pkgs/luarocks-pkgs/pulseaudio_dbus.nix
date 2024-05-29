{
  buildLuarocksPackage,
  dbus_proxy,
  fetchgit,
  fetchurl,
  lua,
  luaOlder,
}:
buildLuarocksPackage {
  pname = "pulseaudio_dbus";
  version = "0.12.0-2";
  knownRockspec =
    (fetchurl {
      url = "mirror://luarocks/pulseaudio_dbus-0.12.0-2.rockspec";
      sha256 = "050s5819q7v9fs28xrgvpl82pzajvs9sm317nrn0qi018yq64pyv";
    })
    .outPath;
  src = fetchgit (removeAttrs (builtins.fromJSON ''    {
      "url": "https://github.com/stefano-m/lua-pulseaudio_dbus",
      "rev": "b0f6774870658c2f776af6ad4596037f2f60191e",
      "date": "2017-11-11T17:48:42+00:00",
      "path": "/nix/store/38g57wg31hgl29lz4za3csqhqbk4f67a-lua-pulseaudio_dbus",
      "sha256": "1l4nalziwmy3d7sb4jij2d1cml5ghzkg8cwj25v82brj36v3kqd7",
      "hash": "sha256-p+E5thkyL4F2EZIz9OaHr9DKQhMySrL0acNXHj9VltA=",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
  '') ["date" "path" "sha256"]);

  disabled = luaOlder "5.1";
  propagatedBuildInputs = [dbus_proxy lua];

  meta = {
    homepage = "https://github.com/stefano-m/lua-pulseaudio_dbus";
    description = "Control PulseAudio devices using DBus";
    license.fullName = "Apache v2.0";
  };
}
