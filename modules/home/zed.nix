#let
#   codium-keybindings = ./keybindings.json # path
#in
{ system, ... }:
{
    programs.zed-editor = {
        enable = true;
        extensions = [ "nix" "toml" "rust" ];
        userSettings = {
            enabled = true;
        version = "2";
        default_open_ai_model = null;

        # Provider options:
        # - zed.dev models (claude-3-5-sonnet-latest) requires GitHub connected
        # - anthropic models (claude-3-5-sonnet-latest, claude-3-haiku-latest, claude-3-opus-latest) requires API_KEY
        # - copilot_chat models (gpt-4o, gpt-4, gpt-3.5-turbo, o1-preview) requires GitHub connected
        default_model = {
          provider = "copilot_chat";
          model = "gpt-3.5-turbo";
        };
        theme = {
          mode = "system";
          dark = "One Dark";
          light = "One Light";
        };
        hour_format = "hour24";
        vim_mode = true;
        base_keymap = "VSCode";
        #installRemoteServer = true;
    };
  };
}
