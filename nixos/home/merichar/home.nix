{ ... }:

{
  imports = [
    ./bash.nix
    ./dircolors.nix
  ];

  home.username = "merichar";
  home.homeDirectory = "/home/merichar";

  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
  ];

  # This controls Home Manager compatibility defaults, not package versions.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
