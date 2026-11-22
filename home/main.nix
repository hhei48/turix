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
  home.file = {
    ".config/niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/hei/turix/home/niri.kdl";
    ".config/wallpaper/wallpaper.jpg".source = config.lib.file.mkOutOfStoreSymlink "/home/hei/turix/home/wallpaper.jpg";
  };

  programs.home-manager.enable = true;
  home = {
    stateVersion = "26.05";
    username = "hei";
    homeDirectory = "/home/hei";
  };
}
