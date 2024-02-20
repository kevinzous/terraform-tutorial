## A- AWS configuration
### 1- Creating AWS account 

- with a free-tier available for 12 months: https://aws.amazon.com/fr/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all
- it includes 750 hours of EC2 compute for t2.mico so enough for our ressources configured in `main.tf`
![alt text](free_tie.png)
- 5 Go of S3 storage bucket

### 2- Generating AWS credentials
This was a hassle finding the right documentation and navigating through all.
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey
In the end, just need to:
* go to aws console
* go to the profile > Security credentials > Access keys
* create access key (careful: Root user access keys are not recommended and is not a best practice)
* run 
```sh
export AWS_ACCESS_KEY_ID=XXX
export AWS_SECRET_ACCESS_KEY=XXX
```

## 3- Install Terraform CLI

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


## 4- (Optional for tutorial) Install AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```sh
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version
```

## B- Terraform commands

```
cd `dir`
terraform init # downloads and installs the providers defined in the configuration in .terraform
               # create a file .terraform.lock.hcl containing version of provider specified
terraform fmt # format the config files 
terraform validate # validate config files (check on syntax and consistency with respect to variables and existing states)
terraform plan # create an execution plan
terraform apply # When applied your configuration, Terraform wrote data into a file called terraform.tfstate

terraform state
terraform state list # list of the resources in your project's state.

terraform destroy
```