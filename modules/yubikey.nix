{pkgs, ...}:
{
  # TODO, separate gnupg from yubikey
  # very blunt way of enabling login and sudo with hardware keys
  # currently should work for me because well,
  #   i only have that many computers (4) and that many users (1 + root)
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam.services = {
    login = {
      u2fAuth = true;
      unixAuth = true;
    };
    sudo = {
      u2fAuth = true;
      unixAuth = true;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
