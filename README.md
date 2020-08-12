# MediaWiki 

![architecture](https://github.com/kmanvitha30/MediaWiki/blob/master/mediawiki.png)


The below automation is used to set-up mediawiki with mariadb as the database.

### Pre-Requisities
The machine from which the automation script is executed should have terraform and git installed.

```sh
sudo wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
sudo unzip ./terraform_0.13.0_linux_amd64.zip –d /usr/local/bin
terraform –v
sudo yum install git
git --version
```
### Usage

1. Clone the below git repository and make Terraform as current working directory.
```sh
git clone https://github.com/kmanvitha30/MediaWiki.git
cd MediaWiki/Terraform/
```
2. Execute the .tf files
```sh
terraform apply 
```
**NOTE** : The files **credentils.json** and **terraform.tfvars** have to be updated with the respective values prior execution.

3. Upon successfull execution, the MediaWiki endpoint can be accessed at http://<server_public_ip>:30007 and the mariadb **root** user password is printed as part of terraform execution in the terminal.
