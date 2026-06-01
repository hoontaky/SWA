#/bin/bash
# 로컬에서 빌드 환경 구축 후, 관련 라이브러리를 업로드할 때 사용 하는 shell
# repository 폴더 내에 파일이 많을 경우, 오류 발생 가능
# 이에 repository 하위 첫 번째 폴더 명만 읽어와서 폴더 별로 하위 파일들을 업로드 함

username="admin"
password="admin"
nexus_url="http://1270.0.0.0:8081/repository/maven-releases"

work_path="/app/cicd/work"
backup_path="/app/cicd/work/backup"

# original library folder path
lib_prefix_path="/app/cicd/work/repository"

cd ${lib_prefix_path}

find . -maxdepth 1 ! -name . | cut -c 3- | sort > ${work_path}/lib-suffix-list.out

while read i; do
	echo "suffix :: ${i}"
	
	find ./${i} -type f -name '*.*' | cut -c 3- | sort > ${work_path}/upload-lib-list.out
	
	while read j; do
		echo "upload $j to ${nexus_url}/${j}"
		curl -v -u ${username}:${password} --upload-file $j "${nexus_url}/${j}"
	done < ${work_path}/upload-lib-list.out
	
	mv ${work_path}/upload-lib-list.out ${backup_path}/upload-lib-list-$(date '%y%m%d-%H%M').out
done < ${work_path}/lib-suffix-list.out

