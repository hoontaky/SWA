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
		git clone --mirror http://${userName}:${password}@127.0.0.1:8090/com/common.git
	"""
}

withCredentials([usernamePassword(credentialsId: 'jenkins', passwordVariable: 'password', usernameVariable: 'userName')]) {
	
	dir('./common.git') {
		sh """
			git remote add target http://${userName}:${password}@127.0.0.1:9090/com/common.git
			git push target --mirror
		"""
		
		<!--
			// for 사용 시에는 "target" 사용하면 오류 발생함. git은 저장소 명을 하나만 사용 가능함. >> for 문 key 값 사용 권장
			ex)
			for (int inx=0; inx<keyList.size(); inx++) {
				def key = keyList[inx]
				sh """
					git remote add ${key} http://${userName}:${password}@127.0.0.1:9090/com/common.git
					git push ${key} --mirror
				"""
			}
		-->
	}
}