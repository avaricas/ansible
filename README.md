## Description
`NOTE:` 
- For the instance configuration  where uses ansible - is used Ansible version 2.9.
- Ansible must be preinstalled on ec2 instance (via amazon-linux-extras).
------------------------
#### How-to-install Ansible v2.9 on amazon-linux-2 OS
- All commands must be execute by root user: 
```sh
amazon-linux-extras enable ansible2
yum clean metadata
yum install ansible
```
----------------------
#### How to install ansible-collections: 
```sh
ansible-galaxy collection install <collection.name>
```

------------------------
#### How-to-install Ansible-core on amazon-linux-2 OS

##### Prerequisites
OS: Amazon linux 2 instance with python3

------------------------
##### How to Create Python Virtual Environment
```
python3 -m venv <project-name>
```
To start using this virtual environment, you need to activate it:
```
source <project-name>/bin/activate
```
To stop using this virtual environment, you need to deactivate it:
```
deactivate
```
------------------------

#### Installation

Install the following packages:
```
pip install ansible-core boto boto3 botocore
```

#### Ansible galaxy Collections
Installing content 
```
ansible-galaxy install -r collections.yml
```
------------------------
## Molecule
Molecule EC2 is designed to allow use of AWS EC2 for provisioning of test resources.
#### Installation

```
pip install git+https://github.com/ansible-community/molecule
```

###### Create a scenario
With a new role
```
molecule init role -d ec2 my-role
```

###### In a pre-existing role
```
molecule init scenario -d ec2
```
------------------------
- In the directory ansible-role-config/molecule/prototype - there is a prototype project, you can copy the data for a new project.
- Prepare files molecule.yml and  converge.yml for execution of role.
    - converge.yml --is the playbook file that contains the call for your role. Molecule will invoke this playbook with ansible-playbook and run it against an instance created by the driver.
    - molecule.yml --is the central configuration entrypoint for Molecule. With this file, you can configure each tool that Molecule will employ when testing your role.

------------------------

#### Molecule CLI
| Command | Description |
| ------ | ------ |
molecule create | create an instance
molecule list | verify that Molecule has created the instance and they’re up and running
molecule converge | test a role against on instance
molecule login | login on instance
molecule destroy | destroy instance

> For using specific scenario need too use -s (Ex: molecule create -s <scenario-name>)

------------------------
#### Folder hierarchy:

```
├── molecule
│   ├── default
│   └── prototype
├── playbooks
│   └── prerequisites
├── roles
│   ├── role_1
│   ├── role_2
│   ├── role_3
│   └── ...
└── vars
    ├── dev
    │   ├── project_1
    │   ├── project_2
    │   └── ...
    ├── prod
    │   ├── project_1
    │   ├── project_2
    │   └── ...    
    └── test
        ├── project_1
        ├── project_2
        └── ...
```
------------------------
###### Documentation:

[Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
[Ansible Galaxy](https://galaxy.ansible.com/)
[Molecule](https://molecule.readthedocs.io/en/latest/)
[Molecule-ec2](https://github.com/ansible-community/molecule-ec2)
