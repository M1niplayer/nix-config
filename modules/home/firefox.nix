{
  pkgs,
  ...
}:
let
  nixSearchEngine = {
    name = "Nix Packages";
    urls = [
      {
        template = "https://search.nixos.org/packages";
        params = [
          {
            name = "type";
            value = "packages";
          }
          {
            name = "query";
            value = "{searchTerms}";
          }
          {
            name = "channel";
            value = "25.11";
          }
        ];
      }
    ];

    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    definedAliases = [ "@n" ];
  };
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        search.force = true;
        search.default = "ddg";
        search.engines = {
          nix-packages = nixSearchEngine;
        };
        # bookmarks = {
        #   force = true;
        #   settings = [
        #     {
        #       name = "Toolbar";
        #       toolbar = true;
        #       bookmarks = [
        #         {
        #           name = "My NixOS";
        #           url = "https://mynixos.com/";
        #         }
        #       ];
        #     }
        #   ];
        # };
      };
    };
  };
}
