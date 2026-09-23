{ ... }:

{
  # Keep Fluxbox behavior and its visual assets together in Home Manager.
  home.file = {
    ".fluxbox/apps".source = ./fluxbox/apps;
    ".fluxbox/init".source = ./fluxbox/init;
    ".fluxbox/keys".source = ./fluxbox/keys;
    ".fluxbox/menu".source = ./fluxbox/menu;
    ".fluxbox/overlay".source = ./fluxbox/overlay;
    ".fluxbox/styles/Tin_black".source = ./fluxbox/styles/Tin_black;
    ".fluxbox/slitlist".source = ./fluxbox/slitlist;
    ".fluxbox/startup" = {
      executable = true;
      source = ./fluxbox/startup;
    };
    ".fluxbox/windowmenu".source = ./fluxbox/windowmenu;
    ".local/share/wallpapers/linux.png".source = ./wallpapers/linux.png;
  };

  dconf.settings = {
    "net/launchpad/diodon/clipboard" = {
      add-images = true;
      synchronize-clipboards = true;
      use-primary = true;
    };
  };
}
