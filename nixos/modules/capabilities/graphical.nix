{ pkgs, ... }:

let
  upowertray = pkgs.callPackage ../../packages/upowertray { };
in

{
  # Interactive applications for graphical workstations. Servers and other
  # machines without a graphical session should not import this module.
  # Kitty requires scalable fonts; this preserves the Terminus pixel-font
  # character while remaining usable by modern Wayland applications.
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    terminus_font_ttf
  ];

  environment.systemPackages = with pkgs; [
    # Web and communication
    firefox
    signal-desktop
    telegram-desktop

    # Documents and publishing
    calibre
    libreoffice
    kdePackages.okular
    scribus

    # Graphics and photography
    blender
    darktable
    gimp
    inkscape

    # Audio and video
    audacity
    kdePackages.kdenlive
    obs-studio
    vlc

    # CAD and electronics
    freecad
    kicad

    # Graphical utilities
    diodon
    dunst
    filezilla
    kitty
    pasystray
    pavucontrol
    thunar
    upowertray
    xorg.xev
  ];
}
