{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # Terminal stuffs
        bat
        tree

        # Neovim and it's dependencies
        neovim
        ripgrep
        fd
        fzf
        lazygit
        tree-sitter

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
    ];
}
