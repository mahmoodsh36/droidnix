{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    man
    neovim emacs
    git
    zsh
    findutils utillinux gnugrep gnused gnutar xz
    unixtools.top
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

  environment.etcBackupExtension = ".bak";
  time.timeZone = "Asia/Jerusalem";
  system.stateVersion = "24.05";
}