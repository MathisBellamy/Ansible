Role Name
=========

Role that creates local users and groups. 
It also creates users' associated sudoers rules.

Requirements
------------

N/A

Role Variables
--------------

| Variables&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Choices/Defaults | Comments&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; |
|-----------|------------------|----------|
| **users_group_list**<br/>complex (list of dict) | [] | The local groups to create |
| &nbsp;*&nbsp;**users_group_list[\*].name**<br/>&nbsp;&nbsp;string | none | Group name |
| &nbsp;*&nbsp;**users_group_list[\*].rights**<br/>&nbsp;&nbsp;list | none | Sudoers rules associated to the groups. See examples below |
| **users_users_list**<br/>complex (list of dict) | [] | The local users to create |
| &nbsp;*&nbsp;**users_users_list[\*].name**<br/>&nbsp;&nbsp;string | none | User's name |
| &nbsp;*&nbsp;**users_users_list[\*].password**<br/>&nbsp;&nbsp;string | none | User's password |
| &nbsp;*&nbsp;**users_users_list[\*].groups**<br/>&nbsp;&nbsp;list | none | List of groups to which the user belongs |
| &nbsp;*&nbsp;**users_users_list[\*].ssh_key**<br/>&nbsp;&nbsp;boolean | none | Boolean to specify whether you want to deploy a public ssh_key for the current user (stored in `files/ssh_keys/`) |


Dependencies
------------

N/A

Example Playbook
----------------

```yaml
- name: "Create local users & groups & sudoers rules"
  hosts: all
  roles:
    - roles/users
```

Example group_vars
----------------

```yaml
users_users_list:
  - name: "mbellamy"
    password: "test"
    groups:
      - server-admins
    ssh_key: true

users_groups_list:
  - name: "server-admins"
    rights:
      - (ALL:ALL) ALL

```

License
-------

N/A

Author Information
------------------

N/A
