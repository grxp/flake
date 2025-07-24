{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      # LXGW WenKai Screen
      lxgw-wenkai-screen
      # Cantarell
      cantarell-fonts
      # Noto Fonts
      noto-fonts
      noto-fonts-color-emoji
      # 思源宋体/思源黑体 (CJK Fonts)
      # Variable-fonts may cause some apps to not render CJK correctly
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      # So also install non-variable version
      source-han-sans
      source-han-serif
      source-han-mono
      # Monospace fonts
      fira-code
      fira-code-symbols
      cascadia-code
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      # nerd-fonts.droid-sans-mono
      # Some unused fonts
      # Inter font
      # inter
      # Source fonts
      # source-sans-pro
      # source-serif-pro
      # source-code-pro
      # 文泉驿
      # wqy_microhei
      # wqy_zenhei
      # 更纱黑体
      # sarasa-gothic
      # hack fonts (monospace)
      # hack-font
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [
          # Main Sans-Serif Font
          "Cantarell"
          "Noto Sans"
          "lxgw wenkai screen"
          # CJK Fallback
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
          # Unicode Fallback
          "DejaVu Sans"
        ];
        serif = [
          # Main Serif Font
          "Noto Serif"
          # CJK Fallback
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
          # Unicode Fallback
          "DejaVu Serif"
        ];
        monospace = [
          # Main Mono Font
          "Cascadia Code"
          "Cascadia Code NF"
          "Fira Code"
          "JetBrainsMono"
          # CJK Fallback
          "Noto Sans Mono CJK SC"
          "Noto Sans Mono CJK TC"
          "Noto Sans Mono CJK JP"
          "Noto Sans Mono CJK KR"
          # Unicode Fallback
          "DejaVu Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
      subpixel.rgba = "rgb";
    };
  };
}
