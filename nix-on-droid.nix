{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    # essentials
    man git zsh findutils utillinux gnugrep gnused gnutar xz
    unixtools.top unixtools.ping procps openssh

    # tools i need
    neovim emacs
    rsync
    (sbcl.withPackages (ps: with ps; [
      serapeum lparallel alexandria
      cl-ppcre str
      cl-fad
      py4cl
      clingon # command-line options parser
      ironclad # crypto functions
    ]))
  ];

  android-integration.xdg-open.enable = true;

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