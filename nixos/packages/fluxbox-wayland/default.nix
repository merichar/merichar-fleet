{
  autoreconfHook,
  dbus,
  fribidi,
  gettext,
  imlib2,
  lib,
  libdrm,
  libxcb,
  libxcb-wm,
  libxkbcommon,
  libxpm,
  makeWrapper,
  pango,
  pixman,
  pkg-config,
  src,
  stdenv,
  systemd,
  wayland,
  wlroots_0_19,
  xwayland,
}:

stdenv.mkDerivation {
  pname = "fluxbox-wayland";
  version = "unstable-2026-02-19";
  inherit src;

  strictDeps = true;

  # An explicit keys file owns the shortcuts, including after reconfiguration.
  postPatch = ''
    substituteInPlace src/wayland/fbwl_server_bootstrap.c \
      --replace-fail \
      'fbwl_keybindings_add_defaults(&server->keybindings, &server->keybinding_count, server->terminal_cmd);' \
      'if (keys_file == NULL) fbwl_keybindings_add_defaults(&server->keybindings, &server->keybinding_count, server->terminal_cmd);'
    substituteInPlace src/wayland/fbwl_server_reconfigure.c \
      --replace-fail \
      'fbwl_keybindings_add_defaults(&server->keybindings, &server->keybinding_count, server->terminal_cmd);' \
      'if (keys_file == NULL) fbwl_keybindings_add_defaults(&server->keybindings, &server->keybinding_count, server->terminal_cmd);'
  '';

  nativeBuildInputs = [
    autoreconfHook
    gettext
    makeWrapper
    pkg-config
  ];

  buildInputs = [
    fribidi
    imlib2
    libdrm
    libxcb
    libxcb-wm
    libxkbcommon
    libxpm
    pango
    pixman
    systemd
    wayland
    wlroots_0_19
  ];

  # Upstream includes drm_fourcc.h directly instead of using libdrm's
  # pkg-config include flags. On NixOS the header is under include/libdrm.
  NIX_CFLAGS_COMPILE = [ "-I${libdrm.dev}/include/libdrm" ];

  configureFlags = [
    "--disable-x11"
    "--enable-wayland"
    "--disable-xext"
    "--disable-xft"
    "--disable-xinerama"
    "--disable-xrandr"
    "--disable-xrender"
  ];

  enableParallelBuilding = true;

  postInstall = ''
    install -Dm444 ${./fluxbox-wayland.desktop} \
      $out/share/wayland-sessions/fluxbox-wayland.desktop

    wrapProgram $out/bin/fluxbox-wayland \
      --prefix PATH : ${lib.makeBinPath [ xwayland ]}
    wrapProgram $out/bin/startfluxbox-wayland \
      --prefix PATH : ${lib.makeBinPath [ dbus ]}
  '';

  passthru.providedSessions = [ "fluxbox-wayland" ];

  meta = {
    description = "Wayland compositor with Fluxbox-compatible configuration";
    homepage = "https://github.com/pepperpepperpepper/fluxbox-wayland";
    license = lib.licenses.mit;
    mainProgram = "startfluxbox-wayland";
    platforms = lib.platforms.linux;
  };
}
