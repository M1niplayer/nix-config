# System packages which includes options for virtualization support
# Generally, stuff that the root user can use are installed here
{ pkgs, ... }:
{
  # actually exists as a home-manager module
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # kvm module conflics with vbox, workaround by https://github.com/NixOS/nixpkgs/issues/363887#issuecomment-2536693220
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];


    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib # numpy
        openssl
        libgcc # sqlalchemy
        # that's where the shared libs go, you can find which one you need using
        # nix-locate --top-level libstdc++.so.6  (replace this with your lib)
        # ^ this requires `nix-index` pkg
      ];
    };

    mtr.enable = true;

    #used to be gnu agent here; can be enabled with home-manager
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";

      PasswordAuthentication = false;
    };
  };
}
