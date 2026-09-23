{
  fetchFromGitHub,
  gkrellm,
  gtk2,
  lib,
  pkg-config,
  stdenv,
}:

stdenv.mkDerivation {
  pname = "gkrellm-bfm";
  version = "0.6.4";

  src = fetchFromGitHub {
    owner = "JNRowe";
    repo = "bfm";
    rev = "8ebde9b80599a6fb9236bbbf91c82f625e9fdf6b";
    hash = "sha256-/pvZG0dSmjeKDJ3q0V3TpbiOnSQZ1rWIKbON5jYfWRk=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ gkrellm gtk2 ];

  postPatch = ''
    substituteInPlace gkrellm-bfm.c \
      --replace-fail \
        'cb_interval_modified(GtkWidget *widget, GtkSpinButton *spin)' \
        'cb_interval_modified(GtkSpinButton *spin, gpointer data)' \
      --replace-fail \
        'update_interval = gtk_spin_button_get_value_as_int(spin);' \
        '(void) data;
        update_interval = gtk_spin_button_get_value_as_int(spin);'

    substituteInPlace Makefile \
      --replace-fail \
        'GTK2_CFLAGS = $(shell pkg-config gtk+-2.0 --cflags)' \
        'GTK2_CFLAGS = $(shell pkg-config gtk+-2.0 --cflags) -I${gkrellm}/include' \
      --replace-fail 'LDFLAGS = -shared -Wl' 'LDFLAGS = -shared'
  '';

  makeFlags = [ "gkrellm" ];

  installPhase = ''
    install -Dm755 gkrellm-bfm.so \
      $out/lib/gkrellm2/plugins/gkrellm-bfm.so
  '';

  meta = {
    description = "GKrellM system monitor plugin with fish, bubbles, and a duck";
    homepage = "https://github.com/JNRowe/bfm";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
