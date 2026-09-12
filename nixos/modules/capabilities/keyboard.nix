{ ... }:

{
  # Use the same keymap for the console and graphical sessions. Fluxbox-Wayland
  # reads the XKB_DEFAULT_* variables when it creates its Wayland keymap.
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "ctrl:nocaps";
  };

  console.useXkbConfig = true;

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "dvorak";
    XKB_DEFAULT_OPTIONS = "ctrl:nocaps";
  };
}
