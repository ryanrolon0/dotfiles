{ ... }:

{
  homebrew = {
    enable = true;
    casks = [ 
      "whatsapp"
      "background-music"
    ];
    masApps = {
      "AdGuard" = 1440147259;
    };
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}