#!/bin/bash

git clone --mirror <original_git_branch> https://<original_git_url>/<git_repo>.git

cd ./<original_git_repo>.git

git remote add target http://<gitId>@<target_git_url>/<git_repo>.git
git push target --mirror

exit 1

----- for example 1 -----

git clone --mirror http://hoontaky@127.0.0.1:8090/com/common.git

cd ./common.git

git remote add target http://root@127.0.0.1:9090/com/common.git
git push target --mirror

exit 1

----- for example 2 -----

withCredentials([usernamePassword(credentialsId: 'jenkins', passwordVariable: 'password', usernameVariable: 'userName')]) {
	sh """
		git clone --mirror http://hoontaky@127.0.0.1:8090/com/common.git
	"""
}

withCredentials([usernamePassword(credentialsId: 'jenkins', passwordVariable: 'password', usernameVariable: 'userName')]) {
	dir('./common.git') {
		git remote add target http://root@127.0.0.1:9090/com/common.git
		git push target --mirror
	}
}