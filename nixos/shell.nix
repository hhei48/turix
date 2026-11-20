{ inputs, config, pkgs, ... }:

{
  # ZSH setting
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
    promptInit = ''
      eval "$(starship init zsh)"    
    '';
  };


  # Env var + Shell alias
  environment = {
    variables = {
      EDITOR = "hx";
    };
    shellAliases = {
      reb = "./rebuild";
      cat = "bat";
      ls = "eza -l --git --hyperlink --header";
      ff = "fastfetch";
    };
  };
}
