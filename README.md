## Prerequisite

- Ansible
- Terraform
- gcloud cli(recommended)

## Setup gcloud-cli

- sudo snap install google-cloud-cli
- gcloud auth login
- gcloud config set project <PROJECT-ID>
- gcloud auth activate-service-account --key-file terraform/<service-account-json-key>.json 


## Create a service account

- https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account

## Create a set of public and private key and confgure it with Compute Engine -> Metadata

- Create a ssh key
- Copy pub key and upload to google cloud > compute engine > metadata section
- ``` ssh-keygen -f ~/.ssh/known_hosts ```

## How to Run

- terraform init
- terraform fmt
- terraform plan
- terraform apply --auto-approve
- terraform destroy --auto-approve

























## Blogs to know about terraform and Ansible
- https://blog.knoldus.com/introduction-to-terraform-1/
