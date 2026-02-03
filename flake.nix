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
        #windows wsl - zure
        #steam deck - anmitsu 
        #home server - muriscratch
        # delay = nixpkgs.lib.nixosSystem {
        #   modules = [
        #     ./loudness

        #     ./modules/i18n.nix
        #     ./modules/kdeplasma.nix
        #     ./modules/nix.nix
        #     ./modules/flatpak.nix

        #     ./modules/codium.nix # mhmm editor
        #     home-manager.nixosModules.home-manager
        #     {
        #       home-manager.useGlobalPkgs = true;
        #       home-manager.useUserPackages = true;

        #       home-manager.users.chaj = import ./home/home.nix;

        #       # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        #     }
        #   ];
        # };
        loudness = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/loudness

            ./modules/i18n.nix
            ./modules/kdeplasma.nix
            ./modules/nix.nix
            ./modules/flatpak.nix

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
