{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; #fix when adding steam deck

      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        #TODO, don't clutter main flake
        zure = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/zure

            ./modules/i18n.nix
            ./modules/nix.nix

            # no home-manager since it contains gui apps that 
            # already exist on the windows machine
          ];
        };

        loudness = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/loudness

            ./modules/i18n.nix
            ./modules/kdeplasma.nix
            ./modules/nix.nix
            # ./modules/k8s.nix

            ./modules/codium.nix # mhmm editor
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              #should import gui packages
              home-manager.users.chaj = import ./home/home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            }
          ];
        };
      };
    };
}
