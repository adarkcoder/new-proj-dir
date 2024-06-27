


# Project Setup Guide

Clone the project repository:

git clone https://github.com/adarkcoder/new-proj-dir.git

## Infrastructure Setup with Terraform

### 1. Generate SSH Key Pair
Navigate to the SSH directory and create an SSH key pair:
```sh
cd terraform/.ssh
ssh-keygen -t rsa -b 4096 -C "manoj@example.com"

2. Update Public Key Path
Move to the Terraform code directory and update the public_key_path variable in the variables.tf file:
 
cd terraform/code
nano variables.tf
# Update the `public_key_path` variable with the path to your public key

3. Initialize and Apply Terraform
Initialize and apply the Terraform configuration:

terraform init
terraform apply -auto-approve
# When prompted for a password, use: NewPassManu
# Alternatively, you can provide your own password and update the Kubernetes secret accordingly in the backend folder inside the Kubernetes folder.

4. Retrieve Bastion Host IP
Get the bastion host public IP address:

terraform output
# Note the `bastion_public_ip`
# Also update the config map with rds_cluster_endpoint

5. SSH into Bastion Host 
SSH into the bastion host using the private key:

ssh -i path_to_private_key ubuntu@bastion_public_ip


6. Configure AWS CLI
Configure the AWS CLI with your access key and secret access key:

aws configure
# Follow the prompts to set the access key ID, secret access key, region, and output format.

7. Connect to EKS Cluster
Update your kubeconfig to connect to the EKS cluster:

aws eks update-kubeconfig --region region-code --name my-eks-cluster

Kubernetes Setup
1. Install Metrics Server
Install the Kubernetes Metrics Server:

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml


2. Install Nginx Ingress Controller
Install the Nginx Ingress Controller:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml

3. Clone the Repository
Clone the project repository:

git clone https://github.com/adarkcoder/new-proj-dir.git


Monitoring Setup
1. Deploy Prometheus and Grafana
Navigate to the Prometheus directory inside the Kubernetes folder and apply the configurations:

cd kubernetes/prometheus
kubectl apply -f crds.yaml
kubectl apply -f eks-monitoring.yaml
kubectl apply -f grafana-ingress.yaml


Application Deployment
1. Deploy Backend and Frontend Pods
From the Kubernetes folder, deploy the backend and frontend pods:

cd ..
kubectl apply -f Backend/ -f Frontend/

Horizontal Pod Autoscaler (HPA)
1. Verify Deployment
Check all pods to ensure they are running:

kubectl get all


2. Test HPA by Stressing a Pod
Execute a stress test in any backend pod:

kubectl exec -it <backend-pod-name> -- stress -c 3

3. Observe Scaling
Observe the pod scaling:

kubectl get pods
# or
kubectl get all

Due to fact i don't have any domain, i used /etc/hosts:

kubectl get service -n ingress-nginx

grab the external ip of ingress-nginx-controller
then to get ips of the loadbalancer do:

nslookup  abff3d0ab5b834442b0d1662afcfcea0-5215a7d77e1b7707.elb.us-east-1.amazonaws.com
#replace with dns name you got from previous step.

you will get three ips, for each ip do:

For Windows localmachine:
Open your text editor in Administrator mode.
In the text editor, open C:\Windows\System32\drivers\etc\hosts.
Add the IP Address and hostname.
Example:
171.10.10.5 backend.example.com
171.10.10.5 frontend.example.com
171.10.10.5 grafana.example.com


Save the changes.

Accessing Services
1. Access the Frontend
Open your local browser and go to:

http://frontend.example.com

2. Access Grafana
Open your browser and go to:

http://grafana.example.com

Explore the metrics and dashboards.


