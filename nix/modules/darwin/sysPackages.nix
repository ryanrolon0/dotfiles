{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    javaPackages.compiler.openjdk25
  ];

  # Installs fonts or nerd fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
