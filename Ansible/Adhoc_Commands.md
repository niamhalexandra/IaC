# Adhoc Commands in Ansible

*Adhoc commands are used for tasks that only need repeating every now and then, they can be used as an alternative to writing a whole playbook*

# What can Ad hoc commands be used for?

* Copying files
* Managing packages
* Managing users

## Copy pem file to node:

command used: 'sudo ansible web -m ansible.builtin.copy -a "src=~/.ssh/tech257.pem dest=~/.ssh/"

Notable Adhoc Commands:

1. Ping to check connectivity "ansible all -m ping"
2. Ping all hosts in inventory & display output in super verbose mode "sudo ansible all -m ping -vvv (add v's for added verbosity)
3. Show system info on all  hosts in inventory "sudo ansible web -a "uname-a" "
