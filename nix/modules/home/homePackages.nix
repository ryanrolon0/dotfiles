{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal and other stuffs
    bat
    tree

    # Neovim and it's dependencies
    neovim
    ripgrep
    fd
    fzf
    lazygit
    tree-sitter
    nil

    # Compilers & interpreters
    python3
    gcc
    cmake

    # Cyber stuffs
    nmap
    metasploit
    wireshark

    # OS fetchers
    neofetch

    # GUI apps
    discord
    chatgpt
    prismlauncher
  ];
}
