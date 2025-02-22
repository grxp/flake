{
  boot.kernel.sysctl = {
    "net.ipv4.tcp_fastopen" = 3;
    "net.core.default_qdisc" = "cake";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "kernel.sysrq" = 502;
  };
}
