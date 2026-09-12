{ pkgs, ... }:

{
  # OpenConnect implements the Cisco AnyConnect protocol without installing
  # Cisco's client. Keep the NetworkManager integration because browser-based
  # SSO must run in the logged-in user's graphical session.
  networking.networkmanager.plugins = [ pkgs.networkmanager-openconnect ];

  environment.systemPackages = [ pkgs.openconnect ];
}
