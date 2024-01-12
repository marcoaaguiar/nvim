# Readme

## Getting started

1. Install pipx
```
sudo apt install pipx
```

2. Install ansible-core 

```
pipx install ansible-core
ansible-galaxy collection install community.general
```

3. Run ansible

```
ansible-playbook tasks/main.yaml -v
```

