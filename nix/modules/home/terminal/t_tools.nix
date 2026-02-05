{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "ryanrolon0";
      user.email = "ryan.rolon@upr.edu";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 120;
      input.method = "portaudio";
      input.source = "Background Music";
    };
  };
}