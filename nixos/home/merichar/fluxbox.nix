{ ... }:

{
  home.file.".fluxbox/startup" = {
    executable = true;
    text = ''
      #!/bin/sh

      # Keep the first Wayland activation minimal. Session services and legacy
      # dockapps are added after the compositor itself is verified.
      exec fluxbox-wayland --terminal kitty
    '';
  };
}
