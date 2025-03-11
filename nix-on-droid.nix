{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    man
    neovim emacs
    git
    zsh
    findutils utillinux gnugrep gnused gnutar xz
    unixtools.top unixtools.ping procps
    rsync
    openssh
  ];

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