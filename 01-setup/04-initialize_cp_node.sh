## Initialize Control Plane Node and has to be run on the control plane node only
# This script initializes the control plane node for Kubernetes using kubeadm.
# It is assumed that the script is run as root or with sudo privileges.
# It is also assumed that the Kubernetes components (kubeadm, kubelet, kubectl) have already been installed on the node.

# Initialize the cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --kubernetes-version=v1.27.0

# Set up kubeconfig for the current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config