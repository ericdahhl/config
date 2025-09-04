{ config, pkgs, lib, ... }:
{
  home.username = "eric";

  home.homeDirectory = "/home/eric";
  programs.home-manager.enable = true;

  # Packages you want globally for your user:
  home.packages = with pkgs; [
    git fzf ripgrep jq yq tmux neovim
    awscli2
    python313
    go_1_23
    nodejs_22 pnpm
    direnv nix-direnv
  ];

  programs.zsh.enable = true;
  programs.fzf.enable = true;
  programs.git = {
    enable = true;
    userName = "Eric Dahlgren";
    userEmail = "eric.dahlgren@asdf.com";
  };

  # direnv integration
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Handy defaults
  home.sessionVariables = {
    EDITOR = "nvim";
    PIP_DISABLE_PIP_VERSION_CHECK = "1";
  };

  # Let HM manage itself
  home.stateVersion = "24.05";
}

