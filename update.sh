#!/usr/bin/env bash

git \
  clone \
  https://github.com/dmitriysafronov/ansible_project-template.git \
  .update

rsync -av \
  --include=.github/workflows/ansible.yaml \
  --include=collections/ansible_collections/README.md \
  --include=collections/README.md \
  --include=inventory/README.md \
  --include=playbooks/README.md \
  --include=roles/README.md\
  --include=.gitignore \
  --include=ansible.cfg \
  --include=requirements.sh \
  --include=update.sh \
  --exclude=* \
  --delete-after \
  .update/ \
  ./

rm -rf .update/
