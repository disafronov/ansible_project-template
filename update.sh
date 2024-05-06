#!/usr/bin/env bash

git \
  clone \
  https://github.com/dmitriysafronov/ansible_project-template.git \
  .update

rsync -av \
  --include=.github/ \
  --include=.github/dependabot.yml \
  --include=.github/workflows/ \
  --include=.github/workflows/ansible.yaml \
  --include=.github/workflows/rebase-on-push-to-main-branch.yaml \
  --include=collections/ \
  --include=collections/README.md \
  --include=collections/ansible_collections/ \
  --include=collections/ansible_collections/README.md \
  --include=inventory/ \
  --include=inventory/README.md \
  --include=playbooks/ \
  --include=playbooks/README.md \
  --include=roles/ \
  --include=roles/README.md\
  --include=.gitignore \
  --include=ansible.cfg \
  --include=requirements.sh \
  --include=update.sh \
  --exclude=** \
  --delete-after \
  .update/ \
  ./

rm -rf .update/
