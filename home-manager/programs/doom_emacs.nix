{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    # deps
    git
    emacs-gtk
    ripgrep
    # optional
    coreutils
    fd
    clang
    libtool
    libvterm
    # :tools debugger
    lldb
    nodejs_22
    # :tools everywhere
    xclip
    xdotool
    xorg.xprop
    xorg.xwininfo
    # :lang cc
    glslang
    # :tools editorconfig
    editorconfig-core-c
    # :lang nix
    nixfmt-rfc-style
    # :lang python
    isort
    pipenv
    python311Packages.pytest
    python311Packages.setuptools
    # :lang sh
    shellcheck
    # :lang markdown
    discount
  ];

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
  ];
  
  home.activation.doomInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
  if [[ -d "${config.home.homeDirectory}/.config/emacs" ]]; then
    echo "[ INFO ] ${config.home.homeDirectory}/.config/emacs dir exists"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] mkdir ${config.home.homeDirectory}/.config/emacs"
    else
      mkdir ${config.home.homeDirectory}/.config/emacs
    fi
  fi
  if [[ "$(ls -A ${config.home.homeDirectory}/.config/emacs)" ]]; then
    echo "[ INFO ] ${config.home.homeDirectory}/.config/emacs is not empty, DOOM emacs is probably there"
    echo "[ INFO ] If DOOM emacs does not run simply delete the directory and re-run your home-manager switch command"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] Cloning doom-emacs to ${config.home.homeDirectory}/.config/emacs "
    else
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/CloudyChris/doom-emacs ${config.home.homeDirectory}/.config/emacs
    fi
  fi
  if [[ -d "${config.home.homeDirectory}/.config/doom" ]]; then
    echo "[ INFO ] ${config.home.homeDirectory}/.config/doom/ dir exists, your config is probably there"
    echo "[ INFO ] If something's wrong simply delete the directory and re-run your home-manager switch command"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] cloning doom config into ${config.home.homeDirectory}"
    else
      echo "[ INFO ] cloning config into ${config.home.homeDirectory}"
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/CloudyChris/doom-config ${config.home.homeDirectory}/.config/doom
    fi
  fi
  '';
  # THIS STILL NEEDS WORK
}
