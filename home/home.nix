{ config, pkgs, ... }:

{
  home.username = "chaj";
  home.homeDirectory = "/home/chaj";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  #TODO wtf
  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    kdePackages.kate
    discord

    # zoom-us
    # xdg-desktop-portal
    obsidian

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    bat

    # # networking tools
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    tree

    # nix related

    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-index
    nix-output-monitor
    nixfmt

    diff-so-fancy # used in bash aliases

    ffmpeg_6-full

    distrobox
    iotop # io monitoring
    iftop # network monitoring

    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings.user = {
      name = "chaj";
      email = "chaithetea@proton.me";
    };
  };
  #yes these exists
  programs.btop.enable = true;
  programs.lazygit.enable = true;

  programs.firefox.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = rec {
      shellsPath = "~/eposr/shells";
      blash = "nix-shell ";

      gosh = blash + shellsPath + "/golang.nix";
      zigsh = blash + shellsPath + "/zigsh.nix";
      jash = blash + shellsPath + "/jash.nix";

      nodesh = blash + shellsPath + "/nodejs.nix";

      pyvenvsh = blash + shellsPath + "/pyvenv.nix";
      pysh = blash + shellsPath + "/py.nix";
      pyfhssh = blash + shellsPath + "/pyfsh.nix";

      bqnsh = blash + shellsPath + "/bqn.nix";
      uash = blash + shellsPath + "/uiua.nix";

      ctfsh = blash + shellsPath + "/ctf.nix";
      vpnsh = blash + shellsPath + "/vpn.nix"; # one day

      #already use lazygit for git add --patch
      gb = "git branch ";
      gs = "git status ";
      gco = "git checkout ";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gl = "git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'";

      nyancat = "bat";

      o = "xdg-open";

      z = "lazygit";

      dc = "cd ~ && cd \"$(find * -type d | fzf)\"";
      dcd = "cd $(find * -type d | fzf)";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
