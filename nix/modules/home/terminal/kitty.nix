{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 14;
    };
    settings = {
      tab_bar_style = "powerline";
      macos_quit_when_last_window_closed = true;
      background_opacity = 0.9;
    };
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
  };
}