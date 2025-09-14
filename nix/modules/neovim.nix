{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Symlink your repo's nvim/ into ~/.config/nvim
  xdg.configFile."nvim/init.lua".source = ../../dotfiles/nvim/init.lua;
  xdg.configFile."nvim/lua".source = ../../dotfiles/nvim/lua;
  xdg.configFile."nvim/neovim.yml".source = ../../dotfiles/nvim/neovim.yml;
  xdg.configFile."nvim/selene.toml".source = ../../dotfiles/nvim/selene.toml;
}
