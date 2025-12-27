# added to environment because I couldn't think of a better way to separate vscode extensions
{ pkgs, ... }:
#let
#   codium-keybindings = ./keybindings.json # path
#in
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        dracula-theme.theme-dracula
      ];
      # insert keybindings
    })
  ];
}
