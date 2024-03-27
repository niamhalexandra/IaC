# Create 2 EC22 Instances

1. Create using image used previously for app using Jenkins. 
2. Ensure SSH (port 22) is open 
3. Name 1 "controller" and the 2nd "agent-app"
   
# SSH in to "Controller" EC2 

1. Use terminal to SSH into the instance as normal.
2. Run update & upgrade commands
3. Run 'sudo apt-get install software-properties-common'
4. Then 'sudo apt-add repository ppa:ansible/ansible'
5. In host file run 'ec2-instance ansible_host=<app agent IP> ansible_user=ubuntu ansible_ssh_private_key_files=/.ssh/tech257.pem
6. Group it as web using [web]

![alt text](<Screenshot 2024-03-25 at 17.32.01.png>)