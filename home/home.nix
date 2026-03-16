{ config, pkgs, system, ... }:

{
  imports = [
    ../modules/home/zed/zed.nix
    ../modules/home/lsp/lsp.nix #im lazy
    ../modules/home/firefox.nix
  ];
  home.username = "chaj";
  home.homeDirectory = "/home/chaj";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    kdePackages.kate
    discord

    zoom-us
    xdg-desktop-portal
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
    mtr
    gping
    dnsutils
    ldns
    doggo
    nmap

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

    #
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-serif
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
  programs.fish = {
    enable = true;
    shellAliases = {
      nyancat = "bat --paging=never -p"; #these are reused but ideally I just exclusively use fish
      ls = "eza --icons --color=auto";
      o = "xdg-open";

      z = "lazygit";

      dc = "cd ~ && cd \"$(find * -type d | fzf)\"";
      dcd = "cd $(find * -type d | fzf)";
    };
  };
  
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

      nyancat = "bat --paging=never -p";
      ls = "eza --icons --color=auto";
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
