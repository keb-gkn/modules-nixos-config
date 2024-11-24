{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    # deps
    git
    emacs
    ripgrep
    # optional
    coreutils
    fd
    clang
    # debugger
    lldb
    nodejs_22
    # everywhere
    xclip
    xdotool
    xorg.xprop
    xorg.xwininfo
  ];
  
  home.activation.doomInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
  if [[ -d "${config.home.homeDirectory}/.config/emacs" ]]; then
    echo "[ INFO ] .config/emacs dir exists"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] mkdir ${config.home.homeDirectory}/.config/emacs"
    else
      mkdir ${config.home.homeDirectory}/.config/emacs
    fi
  fi
  if [[ "$(ls -A ${config.home.homeDirectory}/.config/emacs)" ]]; then
    echo "[ INFO ] ~/.config/emacs is not empty, DOOM emacs is probably there"
    echo "[ INFO ] If DOOM emacs does not run simply delete the directory and re-run your home-manager switch command"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] Cloning doom-emacs to ~/.config/emacs "
    else
      git clone --depth 1 https://github.com/CloudyChris/doom-emacs ~/.config/emacs
    fi
  fi
  if [[ ":$PATH:" == *":${config.home.homeDirectory}/.config/emacs/bin:"* ]]; then
    echo "[ INFO ] ~/.config/emacs/bin already in path"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] adding ~/.config/emacs/bin to PATH"
    else
      export PATH="${config.home.homeDirectory}/.config/emacs/bin:$PATH"
    fi
  fi
  if [[ -d "${config.home.homeDirectory}/.config/doom" ]]; then
    echo "[ INFO ] .config/doom dir exists, your config is probably there"
    echo "[ INFO ] If something's wrong simply delete the directory and re-run your home-manager switch command"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] DOOM INSTALL (cloning doom config into ~/.config/doom)"
    else
      git clone https://github.com/CloudyChris/doom-config ~/.config/doom
    fi
  fi
  '';
  # THIS STILL NEEDS WORK
}
