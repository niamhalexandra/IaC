# Terraform's Part 

![alt text](<Screenshot 2024-03-28 at 12.20.18.png>)

*Firstly use Terraform to provision infrastructure before going onto using a configuration management tool*

* Terraform is cloud agnostic and can provision/manage infrastructure and resources across different cloud providers and on-prem environments
* Less code is needed in Terraform for certain provisioning tasks such as setting up instances/vm's than would be needed in, for example, an ansible playbook
* When on a greenfield project, it would be a go to for building infrastructure as it's really good and easy to use for building from scratch
  
# Ansible's Part

![alt text](<Screenshot 2024-03-28 at 12.20.11.png>)

*Ansible act's like a manager for everything Terraform has built, it defines details and keeps things running smoothly*

* Ansbile is good for the deployment of applications and task automation when it comes to repetitive tasks
* You can write playbooks that Ansible runs to do things like installing packages or configuring certain services
* Playbooks are reusable 
* It can orchestrate complex tasks/workflows across distributed systems
  
# Combined Use

*They are used in synergy, Terraform is best put to use building the initial cloud infrastructure and Ansible then is used to keep it running - they work hand in hand to help manage infrastructure efficiently*