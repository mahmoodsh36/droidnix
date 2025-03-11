{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    man
    neovim
    git
    emacs
    zsh
  ];

  home-manager = {
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;

    config =
      { config, lib, pkgs, ... }:
      {
        programs.zsh.enable = true;
        users.users.nix-on-droid.shell = pkgs.zsh;

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
