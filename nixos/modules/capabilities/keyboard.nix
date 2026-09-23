{ ... }:

{
  # Use the same keymap for the console and X11 sessions.
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
    options = "ctrl:nocaps";
  };

  console.useXkbConfig = true;

}
