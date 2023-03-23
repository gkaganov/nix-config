{
  description = "System Config";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    nixpkgs-test.url = github:nixos/nixpkgs/6d02a514db95d3179f001a5a204595f17b89cb32;

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = args@{ self, nixpkgs, nixpkgs-test, home-manager, ... }: rec {

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    test-pkgs = nixpkgs-test.legacyPackages.x86_64-linux;
    test-result = { inherit home-manager; inherit test-pkgs; };

    nixosConfigurations.IVPC0223 = nixpkgs.lib.nixosSystem {
      specialArgs = test-result;
      modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.gkaganov = args@{ pkgs, ... }: {
              imports = [
                (import home/emacs.nix args)
                (import home/fish.nix args)
                (import home/gpg.nix args)
                (import home/home.nix args)
                (import home/kitty.nix args)
                (import home/neovim.nix args)
                (import home/polybar.nix args)
              ];
            };
          };
        }
        system/hardware-configuration.nix
        system/i18n.nix
        system/network.nix
        system/sound.nix
        system/system.nix
        system/users.nix
        system/xserver.nix
      ];
    };
  };
}

