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
      rev = "f00b8b19e85661cdc0e2fee4127f265a05bf45e1";
      hash = "sha256-HEntl/RTeQNCmjoYhg6S/7fB+Y6QHf+0ZgaaWu5YX50=";
    };
  };
}
