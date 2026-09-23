{ pkgs, ... }:

let
  upowertray = pkgs.callPackage ../../packages/upowertray { };
  wmbubble = pkgs.callPackage ../../packages/wmbubble { };
  gkrellmBfm = pkgs.callPackage ../../packages/gkrellm-bfm { };
in

{
  # Interactive applications for graphical workstations. Servers and other
  # machines without a graphical session should not import this module.
  # Kitty requires scalable fonts; Terminus keeps the pixel-font character.
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
    feh
    kitty
    pasystray
    pavucontrol
    thunar
    upowertray
    xev
    xrdb

    # Fluxbox slit monitors
    gkrellm
    gkrellmBfm
    wmbubble
  ];
}
