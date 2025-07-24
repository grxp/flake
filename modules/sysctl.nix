{
  boot.kernel.sysctl = {
    # --- 网络优化 (黄金组合) ---
    "net.core.default_qdisc" = "cake";
    "net.ipv4.tcp_congestion_control" = "bbr";

    # TCP Fast Open (同时为IPv4和IPv6启用)
    "net.ipv4.tcp_fastopen" = 3;

    # TCP Keepalive (同时为IPv4和IPv6启用，保持连接活性)
    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    # --- IPv6对应项 ---
    "net.ipv6.tcp_keepalive_time" = 60;
    "net.ipv6.tcp_keepalive_intvl" = 10;
    "net.ipv6.tcp_keepalive_probes" = 6;

    # --- 内存与缓存管理 ---
    # 根据你的内存大小可以考虑微调 (16GB+内存可设为10-20)
    # "vm.swappiness" = 35;
    # 降低VFS缓存回收压力，提升文件操作响应速度
    # "vm.vfs_cache_pressure" = 50;

    # --- 磁盘 I/O (平滑写入，防止卡顿) ---
    # "vm.dirty_ratio" = 20;
    # "vm.dirty_background_ratio" = 10;

    # --- 系统调试 (启用安全的SysRq救命组合键) ---
    # 确保你知道如何使用它 (例如 Alt+SysRq+REISUB)
    "kernel.sysrq" = 502;
  };
}
