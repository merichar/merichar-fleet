{ ... }:

{
  programs.dircolors = {
    enable = true;

    # Preserve the established palette while inheriting current defaults for
    # file types that were added after the original configuration was made.
    settings = {
      "DIR" = "0";
      "LINK" = "target";
      "FIFO" = "01;36";
      "SOCK" = "01;36";
      "DOOR" = "01;36";
      "BLK" = "01;36";
      "CHR" = "01;36";
      "ORPHAN" = "01;34";
      "SETUID" = "01;36";
      "SETGID" = "01;36";
      "STICKY_OTHER_WRITABLE" = "01;36";
      "OTHER_WRITABLE" = "0";
      "STICKY" = "01;36";
      "EXEC" = "00;36";
      ".cmd" = "01;36";
      ".exe" = "00;36";
      ".com" = "01;36";
      ".btm" = "01;36";
      ".bat" = "01;36";
      ".sh" = "0;36";
      ".csh" = "0;36";
      ".bin" = "0;36";
      ".dmg" = "00;34";
      ".iso" = "00;34";
      ".tar" = "00;34";
      ".tgz" = "00;34";
      ".arj" = "00;34";
      ".taz" = "00;34";
      ".lzh" = "00;34";
      ".lzma" = "00;34";
      ".tlz" = "00;34";
      ".txz" = "00;34";
      ".zip" = "00;34";
      ".z" = "00;34";
      ".Z" = "00;34";
      ".dz" = "00;34";
      ".gz" = "00;34";
      ".lz" = "00;34";
      ".xz" = "00;34";
      ".bz2" = "00;34";
      ".bz" = "00;34";
      ".tbz" = "00;34";
      ".tbz2" = "00;34";
      ".tz" = "00;34";
      ".deb" = "00;34";
      ".rpm" = "00;34";
      ".jar" = "00;34";
      ".war" = "00;34";
      ".rar" = "00;34";
      ".ace" = "00;34";
      ".zoo" = "00;34";
      ".cpio" = "00;34";
      ".7z" = "00;34";
      ".rz" = "00;34";
      ".jpg" = "00;32";
      ".jpeg" = "00;32";
      ".gif" = "00;32";
      ".bmp" = "00;32";
      ".pbm" = "00;32";
      ".pgm" = "00;32";
      ".ppm" = "00;32";
      ".tga" = "00;32";
      ".xbm" = "00;32";
      ".xpm" = "00;32";
      ".tif" = "00;32";
      ".tiff" = "00;32";
      ".png" = "00;32";
      ".svg" = "00;32";
      ".svgz" = "00;32";
      ".mng" = "00;32";
      ".pcx" = "00;32";
      ".psd" = "00;32";
      ".ico" = "00;32";
      ".mov" = "00;35";
      ".mpg" = "00;35";
      ".mpeg" = "00;35";
      ".m2v" = "00;35";
      ".mkv" = "00;35";
      ".ogm" = "00;35";
      ".mp4" = "00;35";
      ".m4v" = "00;35";
      ".mp4v" = "00;35";
      ".vob" = "00;35";
      ".qt" = "00;35";
      ".nuv" = "00;35";
      ".wmv" = "00;35";
      ".asf" = "00;35";
      ".rm" = "00;35";
      ".rmvb" = "00;35";
      ".flc" = "00;35";
      ".avi" = "00;35";
      ".fli" = "00;35";
      ".flv" = "00;35";
      ".gl" = "00;35";
      ".xcf" = "00;35";
      ".xwd" = "00;35";
      ".yuv" = "00;35";
      ".cgm" = "00;35";
      ".emf" = "00;35";
      ".axv" = "00;31";
      ".anx" = "00;31";
      ".ogv" = "00;31";
      ".ogx" = "00;31";
      ".aac" = "00;31";
      ".au" = "00;31";
      ".flac" = "00;31";
      ".mid" = "00;31";
      ".midi" = "00;31";
      ".mka" = "00;31";
      ".mp3" = "00;31";
      ".mpc" = "00;31";
      ".ogg" = "00;31";
      ".ra" = "00;31";
      ".wav" = "00;31";
      ".axa" = "00;31";
      ".oga" = "00;31";
      ".spx" = "00;31";
      ".xspf" = "00;31";
      ".odt" = "00;33";
      ".doc" = "00;33";
      ".pdf" = "00;33";
      ".xls" = "00;33";
      ".docx" = "00;33";
      ".xlsx" = "00;33";
      ".ppt" = "00;33";
      ".pptx" = "00;33";
      ".epub" = "00;33";
      ".py" = "00;37";
      ".c" = "00;37";
      ".pl" = "00;37";
      ".pm" = "00;37";
      ".java" = "00;37";
      ".rb" = "00;37";
      ".css" = "00;37";
      ".js" = "00;37";
      ".R" = "00;37";
      ".php" = "00;37";
      ".html" = "00;37";
      ".htm" = "00;37";
      ".html.erb" = "00;37";
    };

    extraConfig = ''
      TERM Eterm
      TERM ansi
      TERM color-xterm
      TERM con132x25
      TERM con132x30
      TERM con132x43
      TERM con132x60
      TERM con80x25
      TERM con80x28
      TERM con80x30
      TERM con80x43
      TERM con80x50
      TERM con80x60
      TERM cons25
      TERM console
      TERM cygwin
      TERM dtterm
      TERM eterm-color
      TERM gnome
      TERM gnome-256color
      TERM jfbterm
      TERM konsole
      TERM kterm
      TERM linux
      TERM linux-c
      TERM mach-color
      TERM mlterm
      TERM putty
      TERM rxvt
      TERM rxvt-256color
      TERM rxvt-cygwin
      TERM rxvt-cygwin-native
      TERM rxvt-unicode
      TERM rxvt-unicode256
      TERM screen
      TERM screen-256color
      TERM screen-256color-bce
      TERM screen-bce
      TERM screen-w
      TERM screen.linux
      TERM vt100
      TERM xterm
      TERM xterm-16color
      TERM xterm-256color
      TERM xterm-88color
      TERM xterm-color
      TERM xterm-debian
      TERM xterm-kitty
    '';
  };
}
