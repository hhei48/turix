{ inputs, config, pkgs, ... }:

{
  # Auto login from TTY
  services.getty = {
    autologinUser = "hei";
    autologinOnce = true;
  };
  # Autostart Niri from TTY1, only do it once
  environment.loginShellInit = ''
    if [ "$(tty)" = "/dev/tty1" ] && [ ! -f "/dev/shm/niri-started" ]; then
      touch "/dev/shm/niri-started"
      exec niri-session
    fi
  '';

  # Nix Helper
  programs.nh = {
    enable = true;
    flake = "/home/hei/turix";
  };

  # Niri
  programs.niri.enable = true;

  # 1Password
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "hei" ];
  };
}
