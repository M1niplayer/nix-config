{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    # to avoid problems caused by different versions of nixpkgs.
    #inputs.nixpkgs.follows = "nixpkgs";
    ./peripherals.nix
  ];
  networking.hostName = "loudness";

  users.users.chaj = {
    isNormalUser = true;
    description = "tea";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11"; # Did you read the comment?
}
