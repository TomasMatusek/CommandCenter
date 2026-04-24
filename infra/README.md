# VM settup

- Clone template VM to create VM called `cc-infra`
- SSH to `cc-infra` and:
    - Install Ansible
    - installed Git (should be already installed)
    - Create SSH keys to checkout Git repository with Ansible playbook


## Ansible installation:
```bash
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

## Creating SSH key
```bash
$ ssh-keygen -t ed25519 -C "cc-infra"
$ cat ~/.ssh/id_ed25519.pub
```
Copy the output → go to GitHub → Settings → SSH and GPG keys → New SSH key → paste it.

## Clone repository
```bash
$ mkdir -p workspace/git
$ cd workspace/git
$ git clone https://github.com/YOUT_USERNAME/CommandCenter.git
```

## Test ansible
```bash
$ cd workspace/git/CommandCenter/infra/ansible
$ ansible -i inventory.ini localhost -m ping
localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```