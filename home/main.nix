{
  config,
  ...
}:
{
  imports = [
    ./git.nix
    ./vicinae.nix
    ./1password.nix
    ./ssh.nix
    ./starship.nix
  ];

  # Symlinks configs
  xdg.configFile = {
    "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/niri.kdl";
    "wallpaper/wallpaper.jpg".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/wallpaper.jpg";
  };

  programs.home-manager.enable = true;
  home = {
    stateVersion = "26.05";
    username = "hei";
    homeDirectory = "/home/hei";
  };
}
