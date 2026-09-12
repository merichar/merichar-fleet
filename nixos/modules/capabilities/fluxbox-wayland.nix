{ fluxbox-wayland, pkgs, ... }:

let
  package = pkgs.callPackage ../../packages/fluxbox-wayland {
    src = fluxbox-wayland;
  };
in
{
  environment.systemPackages = [ package ];

  # This also makes the session available to a display manager if one is added
  # later. The initial deployment is launched directly from a logged-in TTY.
  services.displayManager.sessionPackages = [ package ];

  programs.xwayland.enable = true;
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.Fluxbox.default = [ "wlr" "gtk" ];
  };
}
