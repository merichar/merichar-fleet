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
        'cb_interval_modified(GtkAdjustment *adjustment, GtkSpinButton *spin)' \
      --replace-fail \
        'update_interval = gtk_spin_button_get_value_as_int(spin);' \
        '(void) adjustment;
        update_interval = gtk_spin_button_get_value_as_int(spin);' \
      --replace-fail \
        'GtkWidget *tabs = NULL;' \
        'GtkWidget *tabs = NULL;
        GtkWidget *interval_spin = NULL;' \
      --replace-fail \
        'gkrellm_gtk_spin_button(main_box, NULL, update_interval,' \
        'gkrellm_gtk_spin_button(main_box, &interval_spin, update_interval,' \
      --replace-fail \
        'cb_interval_modified, NULL, FALSE,' \
        'NULL, NULL, FALSE,' \
      --replace-fail \
        '_("Updates per second"));' \
        '_("Updates per second"));
    g_signal_connect(G_OBJECT(gtk_spin_button_get_adjustment(
        GTK_SPIN_BUTTON(interval_spin))), "value-changed",
        G_CALLBACK(cb_interval_modified), interval_spin);'

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
