{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    escapeTime = 0;
  };

  xdg.configFile."tmux/tmux.conf".source = ../../dotfiles/tmux/tmux.conf;
}

