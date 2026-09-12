{ ... }:

{
  imports = [
    ../capabilities/audio.nix
    ../capabilities/bluetooth.nix
    ../capabilities/fluxbox-wayland.nix
    ../capabilities/graphical.nix
    ../capabilities/keyboard.nix
    ../capabilities/printing.nix
    ../capabilities/vpn.nix
  ];

  programs.dconf.enable = true;
  programs.nm-applet.enable = true;

  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
