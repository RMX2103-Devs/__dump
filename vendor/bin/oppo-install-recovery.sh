#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:0a18bdc5f5dfc84384aacccfa151c45c1cbac8d4; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:7e069e6b2b0fd8244c3605bd54311a47dc08a5fe \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:0a18bdc5f5dfc84384aacccfa151c45c1cbac8d4 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
