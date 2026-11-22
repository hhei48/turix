{ inputs, config, pkgs, ... }:

{
  # External disk detection
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Themeing
  stylix = {
    # enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  };

  # DConf
  programs.dconf.enable = true;

  # Keyring
  services.gnome.gnome-keyring.enable = true;
  services.dbus.packages = with pkgs; [
    gnome-keyring
    gcr_4
  ];
  security.pam.services.login.enableGnomeKeyring = true;

}
