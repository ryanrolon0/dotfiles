{
  description = "The nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, spicetify-nix, catppuccin }:
  let
    configuration = { lib, ... }: {
      system.primaryUser = "ryanrolon";

      imports = lib.filesystem.listFilesRecursive ./modules/darwin;

      users.users.ryanrolon = {
        name = "ryanrolon";
        home = "/Users/ryanrolon";
      };

      system.defaults = {
        controlcenter.BatteryShowPercentage = true;
        dock.orientation = "left";
        finder.AppleShowAllExtensions = true;
        loginwindow.GuestEnabled = false;
      };

      # Allows Determinate Nix to do its job
      nix.enable = false;

      # Allows unfree packages e.g. VS Code to be installed
      nixpkgs.config.allowUnfree = true;

      nixpkgs.overlays = [
        (final: prev: {
          iniparser = prev.iniparser.overrideAttrs (_: {
            dontUseCmakeBuildDir = true;
            dontBuild = false;
            doCheck = false;
            preBuild = ''
              export CMAKE_ARGS="$CMAKE_ARGS -DBUILD_TESTING=OFF"
            '';
          });
        })
      ];

      # Allows for touch ID for sudo
      security.pam.services.sudo_local.touchIdAuth = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#underhacked
    darwinConfigurations."underhacked" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
          home-manager.users.ryanrolon = {
            imports = [
              ./home.nix
              spicetify-nix.homeManagerModules.spicetify
              catppuccin.homeModules.catppuccin
            ];
          };

          home-manager.backupFileExtension = "backup";
        }

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "ryanrolon";
          };
        }
      ];
    };
  };
}
