# Web App Protection Example - CI/CD Tools build example

In this folder we include examples of descriptive files for pipelines for CI/CD tools.

The files are divided into groups of two different functionalities:

1.  The first group is the files where we describe the steps of the pipelines of each CI/CD tool.

2.  The second group is a group of common files between the pipeles, where the terraform functions and commands that will be used are described.

Segmenting in this way, we make it possible to have a centralized point for changes to *-functions.sh file functions so that whenever a new CI/CD tool is included in the environment, it will not be necessary to rewrite the functions, just create the steps of the new one CI/CD tool calling the *-functions.sh file that already has all functions and conditions duly declared.

## Examples already created:

### jenkins

If you already have a Jenkins environment to run your terraform code or if you intend to use Jenkins as your infrastructure CI/CD Tool, we created a Jenkinsfile example with a pipeline suggestion for this environment. Please, refer to the Jenkins file [link do Jenkinsfile] to view the example.

- Requirements

Jenkins installed and running
Jenkins git plugin installed and running  (https://plugins.jenkins.io/git/)
Terraform installed in the Jenkins instance (https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli)

- Jenkins file rules and conditions

This jenkins file contains rules based on branch names considering two different behavior:

1.  Behavior 1: this behavior happens when the code is pushed to a branch with the same name as an environment folder inside web-app-protection-example/environments/ (E.g., "prd", "dev"or "npd" ).

For this condition, the pipeline code will run steps related to terraform init and terraform apply. When working with multiple environments, it’s really important to change the values of the variables inside the terraform.tfvars files for each environment in order to avoid conflicts.

2.  Behavior 2: differently from behavior 1, this behavior happens when the branch name doesn't match an environment folder name. 

For this condition, the pipeline code will run steps related to terraform init and terraform plan, generating a plan output without changing your infrastructure.


### gitlab

## Examples in development:

Cloud Build


