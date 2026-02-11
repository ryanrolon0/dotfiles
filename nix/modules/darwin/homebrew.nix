{ ... }:

{
  homebrew = {
    enable = true;
    casks = [ 
      "whatsapp"
      "background-music"
      "zen"
    ];
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
