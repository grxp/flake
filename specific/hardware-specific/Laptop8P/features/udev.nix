{
  services.udev.extraRules = ''
    KERNEL=="3-2.2", SUBSYSTEM=="usb", ATTR{power/wakeup}="disabled"
    KERNEL=="3-2.1", SUBSYSTEM=="usb", ATTR{power/wakeup}="disabled"
    KERNEL=="3-1", SUBSYSTEM=="usb", ATTR{power/wakeup}="disabled" 
  '';
  # boot.extraModprobeConfig = ''options nvidia NVreg_DynamicPowerManagement=2'';
}