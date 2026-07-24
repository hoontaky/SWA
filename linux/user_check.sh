#쉘 파일에서 실행 유저 체크

RUNNER=`whoami`
if [ ${RUNNER} != 'cicdadm' ] ; then
	echo "Deny Access : [ ${RUNNER}. Not [cicdadm] ]";
	exit 1;
fi