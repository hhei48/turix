{
  vicinae,
  vicinae-extensions,
  ...
}:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
  };
}
