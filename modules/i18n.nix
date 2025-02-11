{ pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        # waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-rime
          # fcitx5-chinese-addons
        ];
      };
    };
  };
}
