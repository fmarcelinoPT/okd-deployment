this should redirect to the HAProxy machine

https://api.okd.onemarc.io:6443/version
https://api-int.okd.onemarc.io:6443/version

address=/.apps.okd.onemarc.io/192.168.8.32


bootstrap

    #1: `journalctl -b -f -u release-image.service -u bootkube.service`

oc whoami --show-console

https://console-openshift-console.apps.okd.onmemarc.io