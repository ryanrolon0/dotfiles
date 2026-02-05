{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      aiBandBlocker
      beautifulLyrics
      betterGenres
      hidePodcasts
      popupLyrics
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme = "catppuccin-mocha";
  };
}