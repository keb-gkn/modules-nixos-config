{ pkgs, ... }:

{
 # Enable AppImage
    programs.appimage = {
      enable = true;
      binfmt = true;
  };

 # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
   # App
   kdePackages.kate
   kdePackages.kcalc
   kdePackages.kdenlive

   #Utils
   cool-retro-term 
   bottles
   ntfs3g # support NTFS

   # Montage video
   davinci-resolve 

   # Security
   bitwarden 

   # Fetch
   fastfetch   

   # Photos and image
   gimp
   inkscape
   darktable
   upscayl 
   krita

   # Médias
   vlc
   freetube
   spotube

   # Bureautique
   libreoffice-fresh
   hunspell
   hunspellDicts.fr-moderne
   onlyoffice-desktopeditors
   joplin-desktop

   # Navigateur
   brave

   # Messagerie
   thunderbird 
   discord

   # Sync
   git

   # Compression 
   arj
   brotli
   bzip2
   cpio
   gnutar
   gzip
   lha
   libarchive
   lrzip
   lz4
   lzop
   p7zip
   pbzip2
   pigz
   pixz
   unrar
   unzip
   xz
   zip
   zstd
     
 ];
}
