#!/bin/bash
if ! /usr/local/sbin/netsys-base is_init; then
    export GBL_SYS_IGNORE_DEVS_VAL=$(
        while read -r vpnConf; do
            tapName=$(cat $vpnConf | sed -r -ne 's/dev\s(tap.+)/\1/p')
            echo $tapName
        done < <(find /etc/openvpn/server/*.conf -type f)
    )

    /usr/local/sbin/netsys-base init
fi

/usr/local/sbin/netsys-dev inform-state carrier-gained dev:$IFACE
