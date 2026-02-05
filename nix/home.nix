{ lib, ... }:

{
  home.username = "ryanrolon";
  home.homeDirectory = "/Users/ryanrolon";
  home.stateVersion = "25.11";

  imports = lib.filesystem.listFilesRecursive ./modules/home;
  
  catppuccin = {
    accent = "blue";
    enable = true;
  };
}
