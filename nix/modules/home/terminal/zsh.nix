{ ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      drs = "sudo darwin-rebuild switch --flake ~/dotfiles/nix";
      ncg = "sudo nix-collect-garbage -d";
    };
    initContent = ''
      [[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
    '';
  };
}