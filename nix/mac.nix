{ config, pkgs, lib, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home.username = "eric.dahlgren";
  home.homeDirectory = "/Users/eric.dahlgren";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git fzf ripgrep jq yq bat
    awscli2
    python313
    go_1_23
    nodejs_22 pnpm
    direnv nix-direnv
    terraform kubernetes-helm kubectl
    kubectx
  ];

  imports = [
    ./modules/neovim.nix
    ./modules/tmux.nix
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };
  };

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

