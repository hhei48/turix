{
  config,
  ...
}:
{
  imports = [
    ./git.nix
    ./vicinae/vicinae.nix
    ./1password.nix
    ./ssh.nix
  ];

  # Symlinks configs
  xdg.configFile = {
    # Niri
    "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/niri.kdl";
    # Wallpaper
    "wallpaper/wallpaper.jpg".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/wallpaper.jpg";
    # Starship
    "starship.toml".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/starship.toml";
    # Vicinae
    "vicinae/settings.json".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/turix/home/vicinae/settings.json";
  };
dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";


  programs.home-manager.enable = true;
  home = {
    stateVersion = "26.05";
    username = "hei";
    homeDirectory = "/home/hei";
  };
}
