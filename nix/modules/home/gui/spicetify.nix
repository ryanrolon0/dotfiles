{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
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