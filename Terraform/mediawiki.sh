#Installing Docker
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y

#Installing Minikube
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get upgrade -y
sudo wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

#Installing kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo apt-get install -y conntrack
sudo minikube start --vm-driver=none

#Installing Helm
sudo wget https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz
sudo tar xvf helm-v3.0.2-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/
sudo rm helm-v3.0.2-linux-amd64.tar.gz
sudo rm -rf linux-amd64
sudo helm repo add stable https://kubernetes-charts.storage.googleapis.com/


#helm
sudo git clone https://github.com/kmanvitha30/MediaWiki.git
cd MediaWiki/kubernetes/
sudo helm install mediawiki helm-mediawiki
sudo helm install mariadb stable/mariadb
ROOT_PASSWORD=$(sudo kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)
echo $ROOT_PASSWORD

