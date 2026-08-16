{
  inputs,
  lib,
  config,
  ...
}:
let
  profile = "default";
in
{
  programs.firefox = {
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    enable = true;
    profiles.${profile} = {
      extraConfig = ''
        ${builtins.readFile "${inputs.firefox-gnome-theme}/configuration/user.js"}
      '';

      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";

        #TabsToolbar {
          display: none;
        }

        #sidebar-header {
          display: none;
        }
      '';

      userContent = ''
        @import "firefox-gnome-theme/userContent.css;
      '';
    };

  };

  home.file."${config.xdg.configHome}/mozilla/firefox/${profile}/chrome/firefox-gnome-theme".source =
    inputs.firefox-gnome-theme;
}
