# Using Ansible to deploy sparta app

1. create 3 EC2 Instances, 1 as a 'controller', another for the 'app agent' and a third for 'database agent'
2. SSH into the controller EC2, run update and upgrade commands
3. Install Ansible as per previous documentation, check install with 'ansible --version'
4. Ensure 'tech257.pem' file is in the .ssh file and if not, add it with sudo nano 
5. CD into /etc/ansible to edit host file
6. Create [web] group with the ec2-app instance and the app agents ip in command 'ec2-instance ansible_host=<app agent IP> ansible_user=ubuntu ansible_ssh_private_key_files=/.ssh/tech257.pem' and do the same for the database in a [db] group
7. Use 'sudo chmod 400 hosts' to ensure correct permissions are given
8. Use adhoc 'sudo ansible all -m ping' to check communication to other instances is working
   ![alt text](<Screenshot 2024-03-26 at 17.19.42.png>)

9. Now run the playbook created to install mongodb and edit the config file 
10. Check the status of MongoDB on the db instance with 'sudo systemctl status mongodb' to ensure it is running
11. Back on controller - run the app configuration playbook (as visible in app.yml)