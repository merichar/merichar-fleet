{
  fetchFromGitHub,
  lib,
  stdenv,
  xorg,
}:

stdenv.mkDerivation {
  pname = "wmbubble";
  version = "1.54";

  src = fetchFromGitHub {
    owner = "rnjacobs";
    repo = "wmbubble";
    rev = "f43a37e76eed1b0017ebbe19db0050ba8750a268";
    hash = "sha256-kaiifKSrwPu+aBjiOMDjYmdW0KpFqP9/fjbO5RtCy2s=";
  };

  dontConfigure = true;

  buildInputs = [ xorg.libX11 ];

  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];

  installPhase = ''
    install -Dm755 wmbubble $out/bin/wmbubble
    install -Dm644 wmbubble.1 $out/share/man/man1/wmbubble.1
  '';

  meta = {
    description = "Dockapp-style CPU and memory monitor with a swimming duck";
    homepage = "https://github.com/rnjacobs/wmbubble";
    license = lib.licenses.gpl2Plus;
    mainProgram = "wmbubble";
    platforms = lib.platforms.linux;
  };
}
