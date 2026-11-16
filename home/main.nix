{
  ...
}:
{
  imports = [
    ./git.nix
    ./vicinae.nix
    ./1password.nix
    ./ssh.nix
  ];
  programs.home-manager.enable = true;
  home = {
    stateVersion = "26.05";
    username = "hei";
    homeDirectory = "/home/hei";
  };
}
