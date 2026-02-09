#let
#   codium-keybindings = ./keybindings.json # path
#in
{ system, ... }: let
  settings = import ./settings.nix;
  terminal = import ./terminal.nix;
  lsp = import ./lsp.nix;
  extensions = import ./extensions.nix;
in
{
    programs.zed-editor = {
        enable = true;
        extensions = extensions;
        userSettings = 
            settings
            // {
              terminal = terminal;
              lsp = lsp;
              };
        #installRemoteServer = true;
    };
}

