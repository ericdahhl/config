{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Symlink your repo's nvim/ into ~/.config/nvim
  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
