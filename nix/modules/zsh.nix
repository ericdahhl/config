{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''eval "$(direnv hook zsh)"'';
  };

  # Put the zshrc in ~/.zshrc (HOME file, not XDG)
  home.file.".zshrc".source = ../../dotfiles/zsh/zshrc;
}
