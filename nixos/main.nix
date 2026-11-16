{ inputs, config, pkgs, ... }:

{
  # Import other files
  imports = [
    ./hardware.nix
    ./misc.nix
    ./pkgs.nix
    ./programs.nix
    ./shell.nix
    ./system.nix
  ];

  # No no changing
  system.stateVersion = "26.05";
}
