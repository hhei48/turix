{
  ...
}:
{
  home.file.".config/1Password/ssh/agent.toml".text = ''
    [[ssh-keys]]
    vault = "Developer"
  '';
}
