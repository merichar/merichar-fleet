{ doom-emacs, ... }:

{
  xdg.configFile = {
    # Link the pinned upstream tree recursively so Doom's .local directory can
    # remain writable and machine-local.
    "emacs" = {
      source = doom-emacs;
      recursive = true;
    };

    # custom.el remains unmanaged generated state. Intentional settings from
    # the old file have been moved into the authored configuration.
    "doom" = {
      source = ./doom;
      recursive = true;
    };
  };
}
