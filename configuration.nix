{ config, pkgs, lib,  ... }:

{
  # Nix configuration ------------------------------------------------------------------------------
  users.nix.configureBuildUsers = true;

  # Enable Flakes and the new command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.zsh.enable = true;

  environment.variables = {
    GOPATH = "/Users/tercyduck/www/go";
  };
  programs.nix-index.enable = true;
}
