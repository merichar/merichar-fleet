{ ... }:

{
  # Manage behavior now; style and wallpaper remain separate.
  home.file = {
    ".fluxbox/apps".source = ./fluxbox/apps;
    ".fluxbox/init".source = ./fluxbox/init;
    ".fluxbox/keys".source = ./fluxbox/keys;
    ".fluxbox/menu".source = ./fluxbox/menu;
    ".fluxbox/overlay".source = ./fluxbox/overlay;
    ".fluxbox/slitlist".source = ./fluxbox/slitlist;
    ".fluxbox/startup" = {
      executable = true;
      source = ./fluxbox/startup;
    };
    ".fluxbox/windowmenu".source = ./fluxbox/windowmenu;
  };

  dconf.settings = {
    "net/launchpad/diodon/clipboard" = {
      add-images = true;
      synchronize-clipboards = true;
      use-primary = true;
    };
  };
}
