---
k3s_version: v1.24.3+k3s1
# this is the user that has ssh access to these machines
ansible_user: op://dev/k3s-sekrits/ansible/ansible_user
ansible_ssh_private_key_file: op://dev/k3s-sekrits/ansible/ansible_ssh_private_key_file
systemd_dir: /etc/systemd/system

# Set your timezone
system_timezone: "America/Indianapolis"

# interface which will be used for flannel
flannel_iface: "eth0"

# apiserver_endpoint is virtual ip-address which will be configured on each master
apiserver_endpoint: "192.168.42.99"

# k3s_token is required  masters can talk together securely
# this token should be alpha numeric only
k3s_token: op://dev/k3s-sekrits/ansible/k3s_token

# change these to your liking, the only required one is--no-deploy servicelb
extra_server_args: "--no-deploy servicelb --no-deploy traefik --kube-apiserver-arg default-not-ready-toleration-seconds=30 --kube-apiserver-arg default-unreachable-toleration-seconds=30 --kube-controller-arg node-monitor-period=20s --kube-controller-arg node-monitor-grace-period=20s --kubelet-arg node-status-update-frequency=5s --no-deploy servicelb --no-deploy traefik --kube-controller-manager-arg bind-address=0.0.0.0 --kube-proxy-arg metrics-bind-address=0.0.0.0 --kube-scheduler-arg bind-address=0.0.0.0 --etcd-expose-metrics true "
extra_agent_args: ""

# image tag for kube-vip
kube_vip_tag_version: "v0.5.0"
# image tag for metal lb
metal_lb_speaker_tag_version: "v0.13.4"
metal_lb_controller_tag_version: "v0.13.4"

# metallb ip range for load balancer
metal_lb_ip_range: "192.168.42.80-192.168.42.90"
