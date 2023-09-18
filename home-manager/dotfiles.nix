{
  inputs,
  outputs,
  lib,
  config,
  ...
  # ...
}: {

  # dotfiles
  xdg.configFile.alacritty.source = ../dotfiles/alacritty/.config/alacritty;
  xdg.configFile.autorandr.source = ../dotfiles/autorandr/.config/autorandr;
  xdg.configFile.bash.source = ../dotfiles/bash;
  xdg.configFile.bspwm.source = ../dotfiles/bspwm/.config/bspwm;
  xdg.configFile.fish.source = ../dotfiles/fish/.config/fish;
  xdg.configFile.kde.source = ../dotfiles/kde/.config;
  xdg.configFile.lf.source = ../dotfiles/lf/.config/lf;
  xdg.configFile.nvim.source = ../dotfiles/nvim/.config/nvim;
  xdg.configFile.picom.source = ../dotfiles/picom/.config;
  xdg.configFile.polybar.source = ../dotfiles/polybar/.config/polybar;
  xdg.configFile.rofi.source = ../dotfiles/rofi/.config/rofi;
  xdg.configFile.starship.source = ../dotfiles/starship/.config;
  xdg.configFile.sxhkd.source = ../dotfiles/sxhkd/.config/sxhkd;
  xdg.configFile.tmux.source = ../dotfiles/tmux;
  xdg.configFile.zsh.source = ../dotfiles/zsh;
}
