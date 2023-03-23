Skills By Drills: AWS Networking Essentials
---

### Schema of the network that you will create during the course 
![network_schema](img/network-schema.png)

### Steps to deploy the infrastructure using Terraform code
* Create an IAM user with Administrator permissions in your AWS account. Follow [this video](https://youtu.be/L8--Gd9JRyE) if you need guidance.
* Install Git, AWS CLI, and Terraform on your machine. [This video](https://youtu.be/S9dlBPLWxkc) provides the necessary instructions.
* Configure AWS CLI with the credentials of your IAM user. [Here is the video](https://youtu.be/hlR6of7aALg) with instructions.
* Clone this repository using the following command.
```
git clone https://github.com/devopsworld-link/skills-by-drills-aws-networking-essentials.git
```
* Navigate to the terraform directory.
```
cd terraform/
```
* Initialize Terraform configuration.
```
terraform init
```
* Execute plan command to validate the Terraform code and to see what changes will be applied.
```
terraform plan
```
* Apply the changes (i.e. deploy the infrastructure) and type `yes` when it asks for confirmation.
```
terraform apply --var-file variables.tfvars
```
### Infrastructure clean-up

Don't forget to destroy the infrastructure when you're done with your experiments. Otherwise **AWS will keep charging you**!
To do that, execute the following command and type `yes` when it asks for confirmation. 
> Make sure you run the command inside the terraform directory 
```
terraform destroy --var-file variables.tfvars
```
