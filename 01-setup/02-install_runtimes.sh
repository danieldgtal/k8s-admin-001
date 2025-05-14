# Update and install dependencies
## This script installs Docker and containerd on Ubuntu 22.04
## It is assumed that the script is run as root or with sudo privileges. In each of the nodes both worker and control plane
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install containerd
sudo apt-get update && sudo apt-get install -y containerd.io

# Configure containerd to use systemd cgroups
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
sudo systemctl restart containerd