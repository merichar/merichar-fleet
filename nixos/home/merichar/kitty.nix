{ ... }:

{
  programs.kitty = {
    enable = true;

    # The graphical system capability installs Kitty; Home Manager owns only
    # this user's configuration and shell integration.
    package = null;

    font = {
      name = "Terminus (TTF)";
      size = 15;
    };

    # Preserve the traditional block cursor and let Bash own the title, just as
    # it does in XTerm. Kitty otherwise replaces it with the running command.
    shellIntegration.mode = "no-cursor no-title";

    settings = {
      scrollback_lines = 5000;
      window_padding_width = 0;

      cursor = "#58a6ff";
      cursor_shape = "block";
      cursor_blink_interval = 0;

      foreground = "#c9d1d9";
      background = "#0d1117";

      color0 = "#484f58";
      color8 = "#6e7681";
      color1 = "#ff7b72";
      color9 = "#ffa198";
      color2 = "#3fb950";
      color10 = "#56d364";
      color3 = "#d29922";
      color11 = "#e3b341";
      color4 = "#58a6ff";
      color12 = "#79c0ff";
      color5 = "#bc8cff";
      color13 = "#d2a8ff";
      color6 = "#39c5cf";
      color14 = "#56d4dd";
      color7 = "#b1bac4";
      color15 = "#ffffff";
    };
  };
}
