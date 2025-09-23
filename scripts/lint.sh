#!/bin/bash

### ---------------------------
### Script to yaml/ansible lint
### ---------------------------

yamllint -d "{extends: default, rules: {line-length: false}}" .
ansible-lint --skip-list=role-name --skip-list=yaml[line-length] --exclude venv/ --exclude molecule/