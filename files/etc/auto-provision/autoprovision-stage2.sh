#!/bin/sh

# autoprovision stage 2: this script will be executed upon boot if the extroot was successfully mounted (i.e. rc.local is run from the extroot overlay)

. /etc/auto-provision/autoprovision-functions.sh

installPackages()
{
    signalAutoprovisionWaitingForUser

    until (opkg update)
     do
        log "opkg update failed. No internet connection? Retrying in 15 seconds..."
        sleep 15
    done

    signalAutoprovisionWorking

    log "Autoprovisioning stage2 is about to install packages"

    # switch ssh from dropbear to openssh (needed to install sshtunnel)
    #opkg remove dropbear
    #opkg install openssh-server openssh-sftp-server sshtunnel

    #/etc/init.d/sshd enable
    #mkdir /root/.ssh
    #chmod 0700 /root/.ssh
    #mv /etc/dropbear/authorized_keys /root/.ssh/
    #rm -rf /etc/dropbear
   sed -i 's,https,http,g' /etc/opkg/distfeeds.conf;
    # CUSTOMIZE
    # install some more packages that don't need any extra steps
 echo "updating all packages!"

   echo "                                                                      "
   echo " ███████████             ███                         █████            "
   echo "░░███░░░░░███           ░░░                         ░░███             "
   echo " ░███    ░███ ████████  ████  █████ █████  ██████   ███████    ██████ "
   echo " ░██████████ ░░███░░███░░███ ░░███ ░░███  ░░░░░███ ░░░███░    ███░░███"
   echo " ░███░░░░░░   ░███ ░░░  ░███  ░███  ░███   ███████   ░███    ░███████ "
   echo " ░███         ░███      ░███  ░░███ ███   ███░░███   ░███ ███░███░░░  "
   echo " █████        █████     █████  ░░█████   ░░████████  ░░█████ ░░██████ "
   echo "░░░░░        ░░░░░     ░░░░░    ░░░░░     ░░░░░░░░    ░░░░░   ░░░░░░  "
   echo "                                                                      "
   echo "                                                                      "
   echo " ███████████                        █████                             "
   echo "░░███░░░░░███                      ░░███                              "
   echo " ░███    ░███   ██████  █████ ████ ███████    ██████  ████████        "
   echo " ░██████████   ███░░███░░███ ░███ ░░░███░    ███░░███░░███░░███       "
   echo " ░███░░░░░███ ░███ ░███ ░███ ░███   ░███    ░███████  ░███ ░░░        "
   echo " ░███    ░███ ░███ ░███ ░███ ░███   ░███ ███░███░░░   ░███            "
   echo " █████   █████░░██████  ░░████████  ░░█████ ░░██████  █████           "
   echo "░░░░░   ░░░░░  ░░░░░░    ░░░░░░░░    ░░░░░   ░░░░░░  ░░░░░            "

   opkg update
   #Go Go Packages
   opkg install base-files busybox ca-bundle cgi-io dnsmasq dropbear firewall fstools fwtool getrandom hostapd-common ip6tables iptables iw iwinfo jshn jsonfilter kernel
   opkg install kmod-ath kmod-ath9k kmod-ath9k-common kmod-cfg80211 kmod-gpio-button-hotplug kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-nat kmod-ipt-offload
   opkg install kmod-lib-crc-ccitt kmod-mac80211 kmod-nf-conntrack kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject kmod-nf-reject6 kmod-nls-base
   opkg install kmod-ppp kmod-pppoe kmod-pppox kmod-slhc kmod-usb-core kmod-usb-ehci libblobmsg-json20210516 libc libgcc1 libip4tc2 libip6tc2 libiwinfo-data libiwinfo-lua libiwinfo20210430
   opkg install libjson-c5 libjson-script20210516 liblua5.1.5 liblucihttp-lua liblucihttp0 libnl-tiny1 libpthread libubox20210516 libubus-lua libubus20210630 libuci20130104
   opkg install libuclient20201210 libustream-wolfssl20201210 libxtables12 logd lua luci luci-app-firewall luci-app-opkg luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio
   opkg install luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system
   opkg install luci-proto-ipv6 luci-proto-ppp luci-ssl luci-theme-bootstrap luci-app-statistics luci-mod-dashboard luci-app-vnstat
   opkg install luci-app-openvpn wireguard-tools luci-app-wireguard openvpn-openssl mtd netifd odhcp6c odhcpd-ipv6only openwrt-keyring opkg ppp ppp-mod-pppoe procd px5g-wolfssl
   opkg install openwrt-keyring opkg ppp ppp-mod-pppoe procd px5g-wolfssl kmod-usb-storage block-mount kmod-fs-ext4 kmod-fs-exfat fdisk luci-compat luci-lib-ipkg
   opkg install kmod-rt2800-usb rt2800-usb-firmware kmod-cfg80211 kmod-lib80211 kmod-mac80211 kmod-rtl8192cu luci-base luci-ssl luci-mod-admin-full
   opkg install luci-theme-bootstrap kmod-usb-storage kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk resize2fs htop debootstrap luci-compat luci-lib-ipkg dnsmasq
   opkg install git git-http jq curl bash wget kmod-usb-net-rndis luci-mod-dashboard luci-app-commands luci-app-vnstat rpcd-mod-luci luci-app-statistics luci-app-samba4 samba4-server luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system kmod-usb-net-cdc-eem
   opkg install  kmod-usb-net-cdc-ether kmod-usb-net-cdc-subset kmod-nls-base kmod-usb-core kmod-usb-net kmod-usb-net-cdc-ether kmod-usb2 kmod-usb-net-ipheth usbmuxd libimobiledevice usbutils luci-app-nlbwmon luci-app-adblock nano ttyd fail2ban speedtest-netperf opkg install vsftpd samba36-server luci-app-samba

 ## V2RAYA INSTALLER ##
   echo "Installing V2rayA..."
  ## download

  opkg update; opkg install unzip wget-ssl

    ## Remove DNSMasq

  opkg remove dnsmasq

  opkg install dnsmasq-full

  opkg install v2raya

  opkg install /etc/luci-app-v2raya_6_all.ipk

  sed -i 's,http,https,g' /etc/opkg/distfeeds.conf;

  echo "PrivateRouter update complete!"
}

autoprovisionStage2()
{
    log "Autoprovisioning stage2 speaking"

    # TODO this is a rather sloppy way to test whether stage2 has been done already, but this is a shell script...
    if [ $(uci get system.@system[0].log_type) == "file" ]; then
        log "Seems like autoprovisioning stage2 has been done already. Running stage3."
        #/root/autoprovision-stage3.py
    else
        signalAutoprovisionWorking
ping 19
	echo Updating system time using ntp; otherwise the openwrt.org certificates are rejected as not yet valid.
        ntpd -d -q -n -p 0.openwrt.pool.ntp.org

        # CUSTOMIZE: with an empty argument it will set a random password and only ssh key based login will work.
        # please note that stage2 requires internet connection to install packages and you most probably want to log in
        # on the GUI to set up a WAN connection. but on the other hand you don't want to end up using a publically
        # available default password anywhere, therefore the random here...
        #setRootPassword ""

        installPackages

        chmod +x ${overlay_root}/etc/rc.local
        cat >${overlay_root}/etc/rc.local <<EOF
chmod a+x /etc/stage3.sh
bash /etc/stage3.sh || exit 1
EOF

        mkdir -p /var/log/archive

        # logrotate is complaining without this directory
        mkdir -p /var/lib

        uci set system.@system[0].log_type=file
        uci set system.@system[0].log_file=/var/log/syslog
        uci set system.@system[0].log_size=0

        uci commit
        sync
        reboot
    fi
}

autoprovisionStage2
