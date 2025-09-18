{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    # essentials
    man git zsh findutils utillinux gnugrep gnused gnutar xz
    unixtools.top unixtools.ping procps openssh

    # tools i need
    neovim emacs
    rsync
    sbcl
    # (sbcl.withPackages (ps: with ps; [
    #   cl-ppcre str
    #   cl-fad
    #   clingon # command-line options parser
    #   ironclad # crypto functions
    # ]))
  ];

  # enable some fancy/useful stuff
  android-integration.xdg-open.enable = true;
  # android-integration.termux-setup-storage.enable = true;
  # android-integration.termux-wake-lock.enable = true;
  # android-integration.termux-wake-unlock.enable = true;
  # android-integration.unsupported.enable = true;
  # android-integration.termux-reload-settings.enable = true;
  # android-integration.termux-open-url.enable = true;
  # android-integration.termux-open.enable = true;
  # android-integration.am.enable = true;

  user = {
    userName = "mahmooz";
    shell = "${pkgs.zsh}/bin/zsh";
  };

  home-manager = {
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;

    config =
      { config, lib, pkgs, ... }:
      {
        home.stateVersion = "24.05";
      };
  };

  # enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.sessionVariables.BRAIN_DIR = "/sdcard/brain";

  environment.etcBackupExtension = ".bak";
  time.timeZone = "Asia/Jerusalem";
  system.stateVersion = "24.05";
}