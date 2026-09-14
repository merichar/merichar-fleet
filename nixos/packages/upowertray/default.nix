{ cmake, fetchFromGitHub, lib, qt6, stdenv, wrapQtAppsHook }:

stdenv.mkDerivation {
  pname = "upowertray";
  version = "1.1.8";

  src = fetchFromGitHub {
    owner = "BenGWeeks";
    repo = "upowertray";
    rev = "6e329ab7e2950aee059a9d6668570998f320d33b";
    hash = "sha256-/XSF89M3TkNNCTvSzKCLLZAnvS8PyE20Hinifj3bP6I=";
  };

  nativeBuildInputs = [ cmake wrapQtAppsHook ];
  buildInputs = [ qt6.qtbase ];

  meta = {
    description = "Lightweight UPower battery tray indicator";
    homepage = "https://github.com/BenGWeeks/upowertray";
    license = lib.licenses.mit;
    mainProgram = "upowertray";
    platforms = lib.platforms.linux;
  };
}
