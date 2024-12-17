{ pkgs, ... }:
let
  jetbra = pkgs.fetchFromGitHub {
    owner = "grxp";
    repo = "jetbra";
    rev = "566fe79c1e758cf27dbf46df1fa7e35ec1068c13";
    sha256 = "sha256-XCOHxD7A0ntosW3aQs7Ks6pIZyvziE4QIF55yxHXcS4=";
  };

  vmoptions = ''
    -Dawt.toolkit.name=WLToolkit
    --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
    --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

    -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
  '';
in
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
  ];

  xdg.configFile."JetBrains/IntelliJIdea${pkgs.jetbrains.idea-ultimate.version}/idea64.vmoptions".text =
    vmoptions;
  xdg.configFile."JetBrains/PyCharm${pkgs.jetbrains.pycharm-professional.version}/pycharm64.vmoptions".text =
    vmoptions;
  xdg.configFile."JetBrains/CLion${pkgs.jetbrains.clion.version}/clion64.vmoptions".text = vmoptions;

  # https://jetbra.in/5d84466e31722979266057664941a71893322460
}
