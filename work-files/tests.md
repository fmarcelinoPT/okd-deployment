curl -k https://api.okd.onemarc.io:6443/version
curl -k https://okd-bootstrap01.onemarc.io:6443/version
curl -k https://okd-master310.onemarc.io:6443/version
curl -k https://okd-master320:6443/version
curl -k https://okd-master330.onemarc.io:6443/version


curl -k https://api-int.okd.onemarc.io:22623/config/worker
curl -k https://okd-bootstrap01.onemarc.io:22623/config/worker
curl -k https://okd-master310.onemarc.io:22623/config/worker
curl -k https://okd-master320:22623/config/worker
curl -k https://okd-master330.onemarc.io:22623/config/worker

https://api.okd.onemarc.io:6443/apis/operator.openshift.io/v1/kubeapiservers/cluster
curl -k https://okd-bootstrap01.onemarc.io:6443/apis/operator.openshift.io/v1/kubeapiservers/cluster