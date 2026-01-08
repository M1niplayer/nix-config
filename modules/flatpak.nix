# added to environment because I couldn't think of a better way to separate vscode extensions
{ pkgs, ... }:
#let
#   codium-keybindings = ./keybindings.json # path
#in
{
  services.flatpak.enable = true;
}
