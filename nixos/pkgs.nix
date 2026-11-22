{ inputs, config, pkgs, ... }:

{
  # Software
  nixpkgs.config.allowUnfree = true;
  # hardware.enableRedistributableFirmware = true; # Extra firmware
  # hardware.enableAllFirmware = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # Terminal
    helix
    btop
    opencode
    yazi
    fzf
    zoxide
    imagemagick
    ffmpeg
    gitui
    systemctl-tui
    podman-tui
    fastfetch
    gdu
    nvtopPackages.intel
    yt-dlp
    bat
    inputs.umpire.packages.${pkgs.stdenv.hostPlatform.system}.default
    eza
    broot
    rclone
    # Apps
    ghostty
    zed-editor
    proton-vpn
    kicad
    freecad
    distrobox
    glade
    obsidian
    activitywatch
    osu-lazer
    obs-studio
    chromium
    nautilus
    localsend
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta
    # Auxilary
    brightnessctl
    gcc
    wl-clipboard
    libnotify
    starship
    git
    pciutils
    podman
    podman-compose
  ];
}
