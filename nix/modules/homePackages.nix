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
    nixd

    # Compilers & interpreters
    python3
    gcc
    cmake

    # Cyber stuffs
    nmap
    metasploit

    # OS fetchers
    neofetch
    
    # GUI apps
    discord
    chatgpt
  ];
}
