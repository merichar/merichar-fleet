{ ... }:

{
  imports = [
    ../capabilities/audio.nix
    ../capabilities/bluetooth.nix
    ../capabilities/graphical.nix
    ../capabilities/printing.nix
  ];

  programs.dconf.enable = true;
  programs.nm-applet.enable = true;

  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
