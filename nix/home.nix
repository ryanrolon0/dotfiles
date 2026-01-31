{ lib, ... }:

{
  home.username = "ryanrolon";
  home.homeDirectory = "/Users/ryanrolon";
  home.stateVersion = "25.11";

  imports = lib.filesystem.listFilesRecursive ./modules;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      drs = "sudo darwin-rebuild switch --flake ~/dotfiles/nix";
    };
    initContent = ''
      [[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
    '';
  };

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

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "neocmake" "everforest-theme" "colored-zed-icons-theme" ];

    userSettings = {
      autosave.after_delay.milliseconds = 1000;
      disable_ai = false;

      theme = "Everforest Dark Medium";
      icon_theme = "Colored Zed Icons";
    };
  };
  
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 14;
    };
    settings = {
      tab_bar_style = "powerline";
      macos_quit_when_last_window_closed = true;
    };
    themeFile = "everforest_dark_medium";
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
  };
}
