Ansible Role Extras
=========
This role installs and configures the additional packages.

#### Example Playbook:
```
---
- name: Configure Server.
  hosts: localhost
  connection: local
  gather_facts: true
  become: true
  # Related to extras role - setup the vars for the tools
  vars:
    tools:
      extras: true
      packages: true
      ...
```
> Allowed values: True or false