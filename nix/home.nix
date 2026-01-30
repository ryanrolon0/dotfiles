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
}
