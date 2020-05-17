#!/system/bin/sh

### MLX KERNEL Q PRE-CONFIGURATION SCRIPT BY THANAS @ XDA
###messy shit. feel free to donate kneecap if you read this

sleep 30;

echo "0" > /proc/sys/fs/dir-notify-enable
echo "20" > /proc/sys/fs/lease-break-time

#### extras
echo fq_codel > /proc/sys/net/core/default_qdisc

########################
#echo 0 > /dev/cpuctl/cgroup.clone_children
#echo 0 > /dev/cpuctl/cgroup.procs
#echo 0 > /dev/cpuctl/cgroup.sane_behavior
#echo 0 > /dev/cpuctl/cpu.rt_period_us
#echo 0 > /dev/cpuctl/cpu.rt_runtime_us
#echo 0 > /dev/cpuctl/cpu.shares
#echo 0 > /dev/cpuctl/notify_on_release
#echo 0 > /dev/cpuctl/release_agent
#echo 0 > /dev/cpuctl/tasks

#echo 0 > /dev/cpuset/cgroup.clone_children
#echo 0 > /dev/cpuset/cgroup.sane_behavior
#echo 0 > /dev/cpuset/notify_on_release

#echo 0 > /dev/stune/background/cgroup.clone_children
#echo 0 > /dev/stune/background/cgroup.procs
#echo 0 > /dev/stune/background/notify_on_release
#echo 0 > /dev/stune/background/schedtune.boost
#echo 0 > /dev/stune/background/schedtune.colocate
#echo 0 > /dev/stune/background/schedtune.prefer_idle
#echo 0 > /dev/stune/background/schedtune.sched_boost
#echo 0 > /dev/stune/background/schedtune.sched_boost_enabled
#echo 0 > /dev/stune/background/schedtune.sched_boost_no_override
#echo 0 > /dev/stune/background/tasks

#echo 0 > /dev/stune/cgroup.clone_children
#echo 0 > /dev/stune/cgroup.procs
#echo 0 > /dev/stune/cgroup.sane_behavior
#echo 0 > /dev/stune/notify_on_release
#echo 0 > /dev/stune/release_agent
#echo 0 > /dev/stune/schedtune.boost
#echo 0 > /dev/stune/schedtune.colocate
#echo 0 > /dev/stune/schedtune.prefer_idle
#echo 0 > /dev/stune/schedtune.sched_boost
#echo 0 > /dev/stune/schedtune.sched_boost_enabled
#echo 0 > /dev/stune/schedtune.sched_boost_no_override
#echo 0 > /dev/stune/tasks

#echo 0 > /dev/stune/foreground/cgroup.clone_children
#echo 0 > /dev/stune/foreground/cgroup.procs
#echo 0 > /dev/stune/foreground/notify_on_release
#echo 0 > /dev/stune/foreground/schedtune.boost
#echo 0 > /dev/stune/foreground/schedtune.colocate
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
#echo 1 > /dev/stune/foreground/schedtune.sched_boost
#echo 0 > /dev/stune/foreground/schedtune.sched_boost_enabled
#echo 0 > /dev/stune/foreground/schedtune.sched_boost_no_override
#echo 0 > /dev/stune/foreground/tasks

#echo 0 > /dev/stune/rt/cgroup.clone_children
#echo 0 > /dev/stune/rt/cgroup.procs
#echo 0 > /dev/stune/rt/notify_on_release
#echo 0 > /dev/stune/rt/schedtune.boost
#echo 0 > /dev/stune/rt/schedtune.colocate
#echo 0 > /dev/stune/rt/schedtune.prefer_idle
#echo 0 > /dev/stune/rt/schedtune.sched_boost
#echo 0 > /dev/stune/rt/schedtune.sched_boost_enabled
#echo 0 > /dev/stune/rt/schedtune.sched_boost_no_override
#echo 0 > /dev/stune/rt/tasks

#echo 0 > /dev/stune/top-app/cgroup.clone_children
#echo 0 > /dev/stune/top-app/cgroup.procs
#echo 0 > /dev/stune/top-app/notify_on_release
#echo 0 > /dev/stune/top-app/schedtune.boost
#echo 0 > /dev/stune/top-app/schedtune.colocate
echo 1 > /dev/stune/top-app/schedtune.prefer_idle
echo 1 > /dev/stune/top-app/schedtune.sched_boost
echo 1 > /dev/stune/top-app/schedtune.sched_boost_enabled
#echo 0 > /dev/stune/top-app/schedtune.sched_boost_no_override
#echo 0 > /dev/stune/top-app/tasks

#echo 0 > /proc/sys/kernel/sched_boost
#echo 1 > /proc/sys/kernel/sched_child_runs_first
#echo 1 > /proc/sys/kernel/sched_tunable_scaling
#echo 1000000 > /proc/sys/kernel/sched_min_granularity_ns
#echo 20000000 > /proc/sys/kernel/sched_wakeup_granularity_ns
#echo 980000 > /proc/sys/kernel/sched_rt_runtime_us
#echo 100000 > /proc/sys/kernel/sched_latency_ns

#echo "0" > /sys/module/cpu_boost/parameters/dynamic_stune_boost
#echo '0:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '0:1324800' > /sys/module/cpu_boost/parameters/input_boost_freq
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
#echo 0 > /sys/module/cpu_boost/parameters/powerkey_input_boost_freq
echo 1200 > /sys/module/cpu_boost/parameters/powerkey_input_boost_ms
#echo 0 > /sys/module/cpu_boost/parameters/sched_boost_on_input
#echo 0 > /sys/module/cpu_boost/parameters/shed_boost_on_powerkey_input

echo "0-3, 6-7" > /dev/cpuset/camera-daemon/cpus
echo "0-7" > /dev/cpuset/top-app/cpus
echo "0-7" /dev/cpuset/foreground/cpus
#echo "0-7" /dev/cpuset/background/cpus
#echo "0-7" /dev/cpuset/system-background/cpus
echo "0" > /dev/cpuset/restricted/cpus
#echo "0-3" > /dev/cpuset/kernel/cpus

echo "0" > /sys/module/workqueue/parameters/power_efficient

#echo "1" > /sys/devices/system/cpu/cpu0/core_ctl/enable
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
#echo 1209600 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq
#echo 100 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load
#echo 1 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl
echo 1 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/iowait_boost_enable


#echo "1" > /sys/devices/system/cpu/cpu4/core_ctl/enable
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
#echo 1574400 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq
#echo 100 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_load
#echo 1 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/pl
echo 1 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/iowait_boost_enable

#echo 1 > /proc/sys/kernel/sched_walt_rotate_big_tasks

echo "0:300000" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "1:300000" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "2:300000" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "3:300000" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "4:825600" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "5:825600" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "6:825600" > /sys/module/msm_performance/parameters/cpu_min_freq
echo "7:825600" > /sys/module/msm_performance/parameters/cpu_min_freq

echo "825600" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "825600" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo "825600" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo "825600" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
echo "300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "300000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "300000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "300000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

#echo "Y" > /sys/module/lpm_levels/L3/cpu0/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu1/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu2/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu3/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu4/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu5/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu6/rail-pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu7/rail-pc/idle_enabled

#echo "Y" > /sys/module/lpm_levels/L3/l3-wfi/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/llcc-off/idle_enabled

#echo "Y" > /sys/module/lpm_levels/L3/cpu0/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu1/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu2/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu3/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu4/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu5/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu6/pc/idle_enabled
#echo "Y" > /sys/module/lpm_levels/L3/cpu7/pc/idle_enabled

echo "Y" > /sys/module/lpm_levels/parameters/cluster_use_deepest_state

write /sys/module/lpm_levels/parameters/sleep_disabled "N" 2>/dev/null

echo "N" > /sys/module/lpm_levels/parameters/sleep_disabled

########################
#echo "25000" > /sys/power/pm_freeze_timeout
echo "CACHE_HOT_BUDDY" > /sys/kernel/debug/sched_features
echo "ENERGY_AWARE" > /sys/kernel/debug/sched_features
echo "FBT_STRICT_ORDER" > /sys/kernel/debug/sched_features
echo "LAST_BUDDY" > /sys/kernel/debug/sched_features
echo "NEXT_BUDDY" > /sys/kernel/debug/sched_features
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features
echo "NO_RT_RUNTIME_SHARE" > /sys/kernel/debug/sched_features
echo "NO_TTWU_QUEUE" > /sys/kernel/debug/sched_features
echo "NO_LB_BIAS" > /sys/kernel/debug/sched_features

sysctl -e -w kernel.panic_on_oops=0
sysctl -e -w kernel.panic=0

########################
echo "0" > /sys/kernel/rcu_expedited
echo "1" > /sys/kernel/rcu_normal

chmod 0664 /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo "710000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
echo "710000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo "0" > /sys/class/kgsl/kgsl-3d0/bus_split
echo "1" > /sys/class/kgsl/kgsl-3d0/force_bus_on
echo "1" > /sys/class/kgsl/kgsl-3d0/force_clk_on
echo "0" > /sys/class/kgsl/kgsl-3d0/force_rail_on
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling

echo "0" > /sys/class/kgsl/kgsl-3d0/force_no_nap

echo "64" > /sys/class/drm/card0/device/idle_timeout_ms

########################
echo "1" > /proc/sys/vm/compact_unevictable_allowed
echo "15" > /proc/sys/vm/dirty_background_ratio
echo "500" > /proc/sys/vm/dirty_expire_centisecs
echo "60" > /proc/sys/vm/dirty_ratio
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs
echo "1" > /proc/sys/vm/oom_dump_tasks
echo "1" > /proc/sys/vm/oom_kill_allocating_task
echo "1200" > /proc/sys/vm/stat_interval
echo "0" > /proc/sys/vm/swap_ratio
echo "10" > /proc/sys/vm/swappiness
echo "10" > /proc/sys/vm/vfs_cache_pressure

echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
echo "96" > /proc/sys/kernel/random/urandom_min_reseed_secs
echo "1024" > /proc/sys/kernel/random/write_wakeup_threshold

#chmod 666 /sys/module/lowmemorykiller/parameters/minfree
#chown root /sys/module/lowmemorykiller/parameters/minfree
#echo '21816,29088,36360,43632,50904,65448' > /sys/module/lowmemorykiller/parameters/minfree

########################
echo "1" > /sys/kernel/fast_charge/force_fast_charge

echo "1" > /sys/kernel/sound_control/mic_gain

echo "Y" > /proc/sys/dev/cnss/randomize_mac

echo "mem" > /sys/power/autosleep

echo "deep" > /sys/power/mem_sleep

echo "10" > /sys/class/thermal/thermal_message/sconfig

#chmod 666 /sys/module/sync/parameters/fsync_enabled
#chown root /sys/module/sync/parameters/fsync_enabled
#echo "Y" > /sys/module/sync/parameters/fsync_enabled

echo "0" > /sys/block/mmcblk0/queue/add_random
echo "0" > /sys/block/mmcblk0/queue/iostats
echo "cfq" > /sys/block/mmcblk0/queue/scheduler
echo "0" > /sys/block/mmcblk0/queue/io_poll
echo "0" > /sys/block/mmcblk0/queue/nomerges
echo "128" > /sys/block/mmcblk0/queue/nr_requests
echo "128" > /sys/block/mmcblk0/queue/read_ahead_kb
echo "0" > /sys/block/mmcblk0/queue/rotational
echo "1" > /sys/block/mmcblk0/queue/rq_affinity
echo "write through" > /sys/block/mmcblk0/queue/write_cache

echo 4 > /sys/block/mmcblk0/queue/iosched/quantum
echo 80 > /sys/block/mmcblk0/queue/iosched/fifo_expire_sync
echo 330 > /sys/block/mmcblk0/queue/iosched/fifo_expire_async
echo 12582912 > /sys/block/mmcblk0/queue/iosched/back_seek_max
echo 1 > /sys/block/mmcblk0/queue/iosched/back_seek_penalty
echo 60 > /sys/block/mmcblk0/queue/iosched/slice_sync
echo 50 > /sys/block/mmcblk0/queue/iosched/slice_async
echo 2 > /sys/block/mmcblk0/queue/iosched/slice_async_rq
echo 0 > /sys/block/mmcblk0/queue/iosched/slice_idle
echo 0 > /sys/block/mmcblk0/queue/iosched/group_idle
echo 1 > /sys/block/mmcblk0/queue/iosched/low_latency
echo 300 > /sys/block/mmcblk0/queue/iosched/target_latency

echo "0" > /sys/block/sda/queue/add_random
echo "0" > /sys/block/sda/queue/iostats
echo "cfq" > /sys/block/sda/queue/scheduler
echo "0" > /sys/block/sda/queue/io_poll
echo "0" > /sys/block/sda/queue/nomerges
echo "128" > /sys/block/sda/queue/nr_requests
echo "128" > /sys/block/sda/queue/read_ahead_kb
echo "0" > /sys/block/sda/queue/rotational
echo "1" > /sys/block/sda/queue/rq_affinity
echo "write through" > /sys/block/sda/queue/write_cache

echo 4 > /sys/block/sda/queue/iosched/quantum
echo 80 > /sys/block/sda/queue/iosched/fifo_expire_sync
echo 330 > /sys/block/sda/queue/iosched/fifo_expire_async
echo 12582912 > /sys/block/sda/queue/iosched/back_seek_max
echo 1 > /sys/block/sda/queue/iosched/back_seek_penalty
echo 60 > /sys/block/sda/queue/iosched/slice_sync
echo 50 > /sys/block/sda/queue/iosched/slice_async
echo 2 > /sys/block/sda/queue/iosched/slice_async_rq
echo 0 > /sys/block/sda/queue/iosched/slice_idle
echo 0 > /sys/block/sda/queue/iosched/group_idle
echo 1 > /sys/block/sda/queue/iosched/low_latency
echo 300 > /sys/block/sda/queue/iosched/target_latency

########################
chmod 0644 /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker
echo "898000.qcom,qup_uart;IPA_WS;NETLINK;[timerfd];c440000.qcom,spmi:qcom,pmi8998@2:qcom,qpnp-smb2;enable_ipa_ws;enable_netlink_ws;enable_netmgr_wl_ws;enable_qcom_rx_wakelock_ws;enable_timerfd_ws;enable_wlan_etscan_wl_ws;enable_wlan_wow_wl_ws;enable_wlan_ws;hal_bluetooth_lock;netmgr_wl;qcom_rx_wakelock;sensor_ind;wcnss_filtr_lock;wlan;wlan_extscan_wl;wlan_ipa;wlan_pno_wl;wlan_wow_wl" > /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker

#settings put global device_idle_constants light_after_inactive_to=5000,light_pre_idle_to=10000,light_max_idle_to=86400000,light_idle_to=43200000,light_idle_maintenance_max_budget=20000,light_idle_maintenance_min_budget=5000,min_time_to_alarm=60000,inactive_to=120000,motion_inactive_to=120000,idle_after_inactive_to=5000,locating_to=2000,sensing_to=120000,idle_to=7200000,wait_for_unlock=true

for i in $(find /sys/class/net -type l); do
  echo "128" > $i/tx_queue_len;
done;

#su -c pm enable com.google.android.gms/.update.SystemUpdateActivity
#su -c pm enable com.google.android.gms/.update.SystemUpdateService
#su -c pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
#su -c pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
#su -c pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
#su -c pm enable com.google.android.gsf/.update.SystemUpdateActivity
#su -c pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
#su -c pm enable com.google.android.gsf/.update.SystemUpdateService
#su -c pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
#su -c pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver

#pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver;

killall -9 android.process.media
killall -9 mediaserver

########################
echo "0" > /proc/sys/kernel/sched_schedstats

echo "1" > /sys/module/printk/parameters/console_suspend

echo "N" > /sys/kernel/debug/debug_enabled

echo "N" > /sys/module/workqueue/parameters/power_efficient
echo "Y" > /sys/module/bluetooth/parameters/disable_ertm
echo "Y" > /sys/module/bluetooth/parameters/disable_esco
echo "N" > /sys/module/cifs/parameters/enable_oplocks
echo "Y" > /sys/module/cryptomgr/parameters/notests
echo "0" > /sys/module/diagchar/parameters/diag_mask_clear_param
echo "0" > /sys/module/dwc3/parameters/ep_addr_rxdbg_mask
echo "0" > /sys/module/dwc3/parameters/ep_addr_txdbg_mask
echo "1" > /sys/module/hid/parameters/ignore_special_drivers
echo "0" > /sys/module/icnss/parameters/dynamic_feature_mask
echo "1" > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo "0" > /sys/module/lowmemorykiller/parameters/lmk_fast_run
echo "0" > /sys/module/lowmemorykiller/parameters/oom_reaper
#echo "0" > /sys/module/ppp_generic/parameters/mp_protocol_compress
echo "0" > /sys/module/rmnet_data/parameters/rmnet_data_log_level
echo "0" > /sys/module/service_locator/parameters/enable
echo "N" > /sys/module/drm_kms_helper/parameters/poll
echo "0" > /sys/module/msm_poweroff/parameters/download_mode
echo "N" > /sys/module/printk/parameters/always_kmsg_dump
echo "Y" > /sys/module/printk/parameters/console_suspend

echo "1" > /sys/module/subsystem_restart/parameters/disable_restart_work

echo "0" > /proc/sys/debug/exception-trace
echo "0 0 0 0" > /proc/sys/kernel/printk

echo "128" > /proc/sys/net/core/netdev_max_backlog
echo "0" > /proc/sys/net/core/netdev_tstamp_prequeue
echo "0" > /proc/sys/net/ipv4/cipso_cache_bucket_size
echo "0" > /proc/sys/net/ipv4/cipso_cache_enable
echo "0" > /proc/sys/net/ipv4/cipso_rbm_strictvalid
echo "0" > /proc/sys/net/ipv4/igmp_link_local_mcast_reports
echo "24" > /proc/sys/net/ipv4/ipfrag_time
echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control
echo "1" > /proc/sys/net/ipv4/tcp_ecn
echo "0" > /proc/sys/net/ipv4/tcp_fwmark_accept
echo "320" > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo "21600" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "1800" > /proc/sys/net/ipv4/tcp_probe_interval
echo "1" > /proc/sys/net/ipv4/tcp_no_metrics_save
echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
echo "0" > /proc/sys/net/ipv6/calipso_cache_bucket_size
echo "0" > /proc/sys/net/ipv6/calipso_cache_enable
echo "48" > /proc/sys/net/ipv6/ip6frag_time

echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_rfc1337
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_window_scaling
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_workaround_signed_windows
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_sack
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_fack
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_low_latency
echo "0" > /proc/sys/net/ipv4/net.ipv4.ip_no_pmtu_disc
echo "1" > /proc/sys/net/ipv4/net.ipv4.tcp_mtu_probing
echo "2" > /proc/sys/net/ipv4/net.ipv4.tcp_frto
echo "2" > /proc/sys/net/ipv4/net.ipv4.tcp_frto_response

if [ -e "/sys/module/lpm_levels/parameters/sleep_disabled" ]; then
chmod 0644 /sys/module/lpm_levels/parameters/sleep_disabled
echo "0" > /sys/module/lpm_levels/parameters/sleep_disabled
fi;
if [ -e "/sys/class/lcd/panel/power_reduce" ]; then
chmod 0644 /sys/class/lcd/panel/power_reduce
echo "1" > /sys/class/lcd/panel/power_reduce
fi;
if [ -e "/sys/module/pm2/parameters/idle_sleep_mode" ]; then
chmod 0644 /sys/module/pm2/parameters/idle_sleep_mode
echo "Y" > /sys/module/pm2/parameters/idle_sleep_mode
fi;
for i in $(find /sys/ -name debug_mask); do
echo "0" > $i;
done
for i in $(find /sys/ -name debug_level); do
echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ce); do
echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ue); do
echo "0" > $i;
done
for i in $(find /sys/ -name enable_event_log); do
echo "0" > $i;
done
for i in $(find /sys/ -name log_ecn_error); do
echo "0" > $i;
done
for i in $(find /sys/ -name snapshot_crashdumper); do
echo "0" > $i;
done
if [ -e /sys/module/logger/parameters/log_mode ]; then
 echo "2" > /sys/module/logger/parameters/log_mode
fi;
for i in $(find /sys/ -name debug_level); do
 echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ce); do
 echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ue); do
 echo "0" > $i;
done
for i in $(find /sys/ -name enable_event_log); do
 echo "0" > $i;
done
for i in $(find /sys/ -name log_ecn_error); do
 echo "0" > $i;
done
for i in $(find /sys/ -name snapshot_crashdumper); do
 echo "0" > $i;
done

########################
#echo userspace > /sys/class/devfreq/soc:qcom,l3-cdsp/governor
#for cpubw in /sys/class/devfreq/*qcom,cpubw*
#do
#    echo "bw_hwmon" > $cpubw/governor
#    echo 50 > $cpubw/polling_interval
#    echo "2288 4577 6500 8132 9155 10681" > $cpubw/bw_hwmon/mbps_zones
#    echo 4 > $cpubw/bw_hwmon/sample_ms
#    echo 50 > $cpubw/bw_hwmon/io_percent
#    echo 20 > $cpubw/bw_hwmon/hist_memory
#    echo 10 > $cpubw/bw_hwmon/hyst_length
#    echo 0 > $cpubw/bw_hwmon/guard_band_mbps
#    echo 250 > $cpubw/bw_hwmon/up_scale
#    echo 1600 > $cpubw/bw_hwmon/idle_mbps
#done
#for llccbw in /sys/class/devfreq/*qcom,llccbw*
#do
#    echo "bw_hwmon" > $llccbw/governor
#    echo 50 > $llccbw/polling_interval
#    echo "1720 2929 3879 5931 6881" > $llccbw/bw_hwmon/mbps_zones
#    echo 4 > $llccbw/bw_hwmon/sample_ms
#    echo 80 > $llccbw/bw_hwmon/io_percent
#    echo 20 > $llccbw/bw_hwmon/hist_memory
#    echo 10 > $llccbw/bw_hwmon/hyst_length
#    echo 0 > $llccbw/bw_hwmon/guard_band_mbps
#    echo 250 > $llccbw/bw_hwmon/up_scale
#    echo 1600 > $llccbw/bw_hwmon/idle_mbps
#done
#for memlat in /sys/class/devfreq/*qcom,memlat-cpu*
#do
#    echo "mem_latency" > $memlat/governor
#    echo 10 > $memlat/polling_interval
#    echo 400 > $memlat/mem_latency/ratio_ceil
#done
#for memlat in /sys/class/devfreq/*qcom,l3-cpu*
#do
#    echo "mem_latency" > $memlat/governor
#    echo 10 > $memlat/polling_interval
#    echo 400 > $memlat/mem_latency/ratio_ceil
#done
#for l3cdsp in /sys/class/devfreq/*qcom,l3-cdsp*
#do
#    echo "userspace" > $l3cdsp/governor
#    chown -h system $l3cdsp/userspace/set_freq
#done
#echo 4000 > /sys/class/devfreq/soc:qcom,l3-cpu4/mem_latency/ratio_ceil
#echo "compute" > /sys/class/devfreq/soc:qcom,mincpubw/governor
#echo 10 > /sys/class/devfreq/soc:qcom,mincpubw/polling_interval

echo "Y" > /sys/kernel/debug/dsi-panel-ebbg-fhd-ft8716-video_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi-panel-ebbg-fhd-ft8716-video_display/ulps_enable
echo "Y" > /sys/kernel/debug/dsi_panel_ebbg_fhd_ft8719_video_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi_panel_ebbg_fhd_ft8719_video_display/ulps_enable
echo "Y" > /sys/kernel/debug/dsi_panel_jdi_fhd_r63452_cmd_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi_panel_jdi_fhd_r63452_cmd_display/ulps_enable
echo "Y" > /sys/kernel/debug/dsi_panel_jdi_fhd_nt35596s_video_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi_panel_jdi_fhd_nt35596s_video_display/ulps_enable
echo "Y" > /sys/kernel/debug/dsi_tianma_fhd_nt36672a_video_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi_tianma_fhd_nt36672a_video_display/ulps_enable
echo "Y" > /sys/kernel/debug/dsi_ss_ea8074_notch_fhd_cmd_display/dsi-phy-0_allow_phy_power_off
echo "Y" > /sys/kernel/debug/dsi_ss_ea8074_notch_fhd_cmd_display/ulps_enable

########################
fstrim /data;
fstrim /cache;
fstrim /system;
