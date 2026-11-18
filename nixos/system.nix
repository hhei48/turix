{ inputs, config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.latest;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Linux kernel version
  # Switch back to latest when get AX211 card
  boot.kernelPackages = pkgs.linuxPackages_6_12;

  # Time & Locale
  time.timeZone = "Asia/Hong_Kong";
  i18n.defaultLocale = "en_HK.UTF-8";

  # User
  users.users."hei" = {
    isNormalUser = true;
    description = "hei";
    extraGroups = [ "networkmanager" "wheel" "podman" ];
    # Set the password with passwd
  };
  
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Creates a symlink from docker to podman
    defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
  };

  # Networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    hostName = "earth";
    useDHCP = false; # Prevent conflict with network manager
  };

  # Disable network power saving modes
  boot.kernelParams = [ "pcie_aspm=off" ];
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlmvm power_scheme=1
  '';
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{class}=="0x028000", ATTR{power/control}="on"
  '';
}
