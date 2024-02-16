Description of Repo Folders/Structure:
The repository consists of multiple directories, each representing a Terraform module responsible for configuring specific resources on GCP. The main.tf file orchestrates the deployment by calling each module.
Deployment Instructions and Dependencies:
1.	Ensure you have Terraform installed on your machine.
2.	Set up authentication with Google Cloud Platform using service account credentials.
3.	Place the Cloud KMS key file in the specified path and update the key_filepath variable in variables.tf.
4.	Update the email_notification variable in variables.tf with the desired email address for alarm notifications.
5.	Run terraform init to initialize the Terraform configuration.
6.	Run terraform plan to preview the changes that will be applied.
7.	Run terraform apply to apply the changes and deploy the infrastructure.
8.	After deployment, the HTTP endpoint will be accessible, and the scheduled job will run every 10 minutes.
Tear-down Instructions:
1.	Run terraform destroy to tear down the deployed infrastructure and delete all resources created by Terraform.
