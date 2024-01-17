#!/usr/bin/env bash

git \
  clone \
  https://github.com/dmitriysafronov/ansible-project.git \
  .update

rsync -av \
  --include=.github/ \
  --include=.github/workflows/ \
  --include=.github/workflows/ansible.yaml \
  --include=collections/ \
  --include=collections/README.md \
  --include=collections/ansible_collections/ \
  --include=collections/ansible_collections/README.md \
  --include=inventory/ \
  --include=inventory/README.md \
  --include=playbooks/ \
  --include=playbooks/README.md \
  --include=roles/README.md\
  --include=roles/ \
  --include=.gitignore \
  --include=ansible.cfg \
  --include=requirements.sh \
  --include=update.sh \
  --exclude=** \
  --delete-after \
  .update/ \
  ./

rm -rf .update/
