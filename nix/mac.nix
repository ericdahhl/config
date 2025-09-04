{ config, pkgs, lib, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home.username = "eric";
  home.homeDirectory = "/Users/eric";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git fzf ripgrep jq yq tmux neovim
    awscli2
    python313
    go_1_23
    nodejs_22 pnpm
    direnv nix-direnv
  ] ++ lib.optionals isDarwin [
    coreutils gnugrep gnu-sed # GNU tools on macOS
  ];

  imports = [
    ../modules/neovim.nix
    ../modules/tmux.nix
  ];

  programs.zsh.enable = true;
  programs.fzf.enable = true;
  programs.git = {
    enable = true;
    userName = "Eric Dahlgren";
    userEmail = "eric.dahlgren@asdf.com";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.05";
}

