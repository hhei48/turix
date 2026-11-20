{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "h@hadrian.cc";
        name = "Hadrian";
      };
      init.defaultBranch = "main";
      # Commit signing is NOT enabled
    };
  };
}
