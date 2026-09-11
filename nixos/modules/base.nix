{ pkgs, ... }:

{
  # Minimal tools expected on every NixOS machine in this fleet.
  environment.systemPackages = with pkgs; [
    # Version control
    git

    # Administration
    rsync
    tree

    # Fleet essentials
    cowsay
  ];
}
