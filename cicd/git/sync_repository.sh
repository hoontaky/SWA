#!/bin/bash

git clone -b <original_git_branch> https://<original_git_url>/<git_repo>.git

cd ./<original_git_repo>

git remote -v
git remote set-url origin http://<gitId>@<target_git_url>/<git_repo>.git
git remote -v
git push -uf origin <target_git_branch>

exit 1

----- for example -----

git clone -b develop http://hoontaky@127.0.0.1:8090/com/common.git

cd ./common

git remote -v
git remote set-url origin http://root@127.0.0.1:9090/com/common.git
git remote -v
git push -uf origin develop

exit 1