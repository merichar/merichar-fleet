{ ... }:

{
  services.xserver = {
    enable = true;
    windowManager.fluxbox.enable = true;

    # Start the graphical session manually from a TTY with `startx`.
    displayManager.startx = {
      enable = true;
      generateScript = true;
    };
  };

  security.polkit.enable = true;
}
