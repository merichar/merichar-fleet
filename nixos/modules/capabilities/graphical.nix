{ pkgs, ... }:

{
  # Interactive applications for graphical workstations. Servers and other
  # machines without a graphical session should not import this module.
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

    # Desktop utilities
    blueman
    dunst
    filezilla
    kitty
    pavucontrol
    thunar
  ];
}
