#!/bin/bash

// nexus info.
username="cicdadm"
password="cicdadm"
nexus_url="http://127.0.0.1:8090/repository/maven-releases"

// shell file path for uploading
work_path="/sw/work"
// backup path after uploading
backup_path="/sw/work/backup"
// library path for uploading
lib_prefix_path="/sw/nexus/nexus-data/storage/releases"
lib_suffix_path="/kr/go/nexus"

cd ${lib_prefix_path}

find .${lib_prefix_path}/${lib_suffix_path} -type f -name '*.*' | cut -c 3- | sort > ${work_path}/upload-lib-list.out

while read i; do
  echo "upload $i to $nexus_url"
  curl -v -u $username:$password --upload-file $i "$nexus_url/$i"
done < $work_path/upload-lib-list.out

mv $work_path/upload-lib-list.out $backup-path}/upload-lib-list-$(date '+%y%m%d-%H%M').out

