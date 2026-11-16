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
}
