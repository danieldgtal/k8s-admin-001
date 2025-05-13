# Kubernetes Hands-On: Full Spectrum Lab for CKA Preparation

This project provides a **comprehensive, hands-on guide to Kubernetes** for those preparing for the [Certified Kubernetes Administrator (CKA)](https://www.cncf.io/certification/cka/) exam. The goal is to **deploy a full product on Kubernetes** while gaining deep experience with all key Kubernetes objects, components, and configurations—**starting from scratch** with a self-managed cluster on Google Cloud Platform (GCP), and building up incrementally from simple stateless applications to more advanced configurations like StatefulSets, persistent storage, security policies, and networking.

> ⚠️ **Important:** This project does **not** use Google Kubernetes Engine (GKE). Instead, it uses virtual machines to provision a raw Kubernetes cluster using tools like `kubeadm`, `containerd`, and `kubelet`, giving you complete control and visibility.

---

## 🧠 Project Goals

- Deploy a real product on Kubernetes
- Start from basic objects (e.g., Pods) to complex ones (e.g., Network Policies)
- Apply best practices as recommended by CNCF
- Learn and practice for the CKA exam
- Use YAML files for all configurations
- Understand the _why_ behind Kubernetes concepts
- Get comfortable with `kubectl`, `kubeadm`, and core tools

---

## 📦 Table of Contents

1. [Cluster Setup on GCP (No GKE)](#-cluster-setup-on-gcp-no-gke)
2. [Kubernetes Core Objects (in order of complexity)](#-kubernetes-core-objects-in-order-of-complexity)
3. [Stateless Application Deployment](#-stateless-application-deployment)
4. [Stateful Application Deployment](#-stateful-application-deployment)
5. [Storage & Persistent Volumes](#-storage--persistent-volumes)
6. [RBAC, Secrets & ConfigMaps](#-rbac-secrets--configmaps)
7. [Networking & Policies](#-networking--policies)
8. [Monitoring, Logging & Probes](#-monitoring-logging--probes)
9. [Helm, CI/CD & Final Project](#-helm-cicd--final-project)

---

## 🔧 Cluster Setup on GCP (No GKE)

We’ll use Google Cloud Compute Engine to provision raw Linux VMs and install Kubernetes manually using `kubeadm`.

### Prerequisites

- A GCP account with billing enabled
- `gcloud` CLI installed
- SSH access to instances
- Basic understanding of Linux CLI

### 🧱 Infrastructure Plan

| Component       | Count | Description                           |
|----------------|-------|---------------------------------------|
| Master Node     | 1     | Runs control plane components         |
| Worker Nodes    | 2+    | Run your actual application pods      |
| OS              | Ubuntu 22.04 LTS                             |
| Networking      | Calico (for network policies)                |
| Container Runtime | containerd                                 |

### 📜 Cluster Setup Guide

```bash
# Create a VM instance template (Ubuntu 22.04, 2vCPU, 4GB RAM)
gcloud compute instances create k8s-master \
  --zone=us-central1-a \
  --machine-type=e2-medium \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud \
  --boot-disk-size=20GB \
  --tags=k8s

# Repeat for worker nodes (k8s-worker-1, k8s-worker-2, etc.)

