{ doom-emacs, ... }:

{
  # The pinned Doom source is read-only in /nix/store; keep Doom's generated
  # packages, profiles, and cache in the user's writable state directory.
  home.sessionVariables.DOOMLOCALDIR = "$HOME/.local/share/doom";

  xdg.configFile = {
    # Link the pinned upstream tree recursively; mutable Doom state is kept in
    # DOOMLOCALDIR above rather than beside the read-only source.
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
