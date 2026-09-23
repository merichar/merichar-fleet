{ pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./dircolors.nix
  ];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  xresources.properties = {
    "Xft.dpi" = 140;
  };

  home.username = "merichar";
  home.homeDirectory = "/home/merichar";

  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.config/emacs/bin"
  ];

  # This controls Home Manager compatibility defaults, not package versions.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
