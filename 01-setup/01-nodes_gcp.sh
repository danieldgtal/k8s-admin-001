# Create control-plane node

## Run the command below to create a control-plane node and two worker nodes in Google Cloud Platform (GCP) using the gcloud command-line tool.
# Make sure you have the gcloud SDK installed and authenticated with your GCP account.
# This script creates a control-plane node and two worker nodes in the us-central1-a zone with Ubuntu 20.04 LTS as the operating system.
# The machine type is set to e2-standard-2 with a boot disk size of 50GB for each instance.
# The control-plane node is named k8s-master and the worker nodes are named k8s-worker1 and k8s-worker2.
gcloud compute instances create k8s-master \
  --zone=us-central1-a \
  --machine-type=e2-standard-2 \
  --image-family=ubuntu-2004-lts \
  --image-project=ubuntu-os-cloud \
  --boot-disk-size=50GB

# Create worker nodes
gcloud compute instances create k8s-worker1 k8s-worker2 \
  --zone=us-central1-a \
  --machine-type=e2-standard-2 \
  --image-family=ubuntu-2004-lts \
  --image-project=ubuntu-os-cloud \
  --boot-disk-size=50GB