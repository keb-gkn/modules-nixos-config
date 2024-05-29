{
  stdenv,
  fetchFromGitHub,
}: {
  nord = stdenv.mkDerivation {
    name = "sddm-nord";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/nord
    '';
    src = fetchFromGitHub {
      owner = "CloudyChris";
      repo = "nord-sddm";
      rev = "accc4f03cb4f72d75ab1e0f6a103f82bc1090402";
      hash = "sha256-Gt+l8SBU/xDy5Sg+cR4OgWS0A+bv28HOFfTx9Zql5jk=";
    };
  };
}
