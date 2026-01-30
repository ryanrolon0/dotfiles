{
    description = "The nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

        nix-darwin.url = "github:nix-darwin/nix-darwin/master";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
        configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = with pkgs; [
            wget
            javaPackages.compiler.openjdk25
        ];

        # Installs fonts or nerd fonts
        fonts.packages = with pkgs; [
            nerd-fonts.fira-code
        ];

        users.users.ryanrolon = {
            name = "ryanrolon";
            home = "/Users/ryanrolon";
        };

        # Allows Determinate Nix to do its job
        nix.enable = false;

        # Allows unfree packages e.g. VS Code to be installed
        nixpkgs.config.allowUnfree = true;

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
                home-manager.users.ryanrolon = import ./home.nix;

                home-manager.backupFileExtension = "backup";
                }
            ];
        };
    };
}
