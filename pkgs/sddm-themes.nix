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
      rev = "c05d462bf44459896665fd8661cd7b45fe4759e3";
      hash = "sha256-4CQN2oBCqwJPCmUroL7bFu2Rc5N2hVHStKdSwonnGw0=";
    };
  };
}
