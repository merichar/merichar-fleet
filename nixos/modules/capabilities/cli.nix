{ pkgs, ... }:

{
  # The fuller command-line environment used on most machines in this fleet.
  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    # Editors
    emacs
    vim

    # Version-control tools
    gh
    git-filter-repo

    # Shell and file utilities
    antiword
    bc
    dos2unix
    htop
    html-tidy
    hxtools
    mc
    ranger
    ripgrep
    scour
    w3m
    wget
    yamllint

    # Terminal sessions
    minicom
    screen
    tmux

    # System and hardware diagnostics
    acpi
    dmidecode
    hdparm
    i2c-tools
    inxi
    ipmitool
    lshw
    lsof
    mtdutils
    nvme-cli
    pciutils
    powertop
    smartmontools
    sunxi-tools
    ubertooth
    usbutils

    # Network diagnostics
    aircrack-ng
    bind
    bsd-finger
    ipcalc
    inetutils
    iw
    nmap
    net-tools
    tcpdump
    traceroute
    whois

    # Development tools
    autoconf
    cmake
    cookiecutter
    gdb
    graphviz
    pkg-config
    rlwrap
    strace
    valgrind

    # Language runtimes for scripts and interactive use. Project libraries
    # and exact toolchain versions belong in each project's development shell.
    R
    jdk
    nodejs
    python3
    ruby

    # Data and media utilities
    exiftool
    f3
    fbcat
    ffmpeg
    highlight
    libheif
    osmium-tool
    p7zip
    rclone
    v4l-utils
    yt-dlp
    yubikey-manager

    # Storage recovery and forensics
    apfsprogs
    ddrescue
    ddrutility
    ext3grep
    gpart
    magicrescue
    myrescue
    safecopy
    sleuthkit
    testdisk
    vmfs-tools

    # Personal information and terminal applications
    gnupg
    irssi
    ncmpcpp
    pass
    tasksh
    taskwarrior3

    # Amusements
    aalib
    bb
    figlet
    fortune
    jp2a
    libcaca
    lolcat
    screenfetch
    sl
    wego
  ];
}
