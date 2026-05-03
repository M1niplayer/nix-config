{
  config,
  lib,
  pkgs,
  ...
}:
{
  #these should contain 
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    # to avoid problems caused by different versions of nixpkgs.
    #inputs.nixpkgs.follows = "nixpkgs";
  ];
  networking.hostName = "zure";

  users.users.chaj = {
    isNormalUser = true;
    description = "tea";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  networking.networkmanager.enable = true; #should be moved

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11"; # Did you read the comment?
}
