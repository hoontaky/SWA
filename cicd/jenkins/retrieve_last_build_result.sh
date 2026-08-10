#!/bin/bash

#Environment List
envs=("dev" "stg" "prd")

#Project List
pjts=("ewpApp" "ewpApi")

c=0
cLen=0
while [ $c -lt $cLen ]; do
  clear
  
  echo "NOW[$((c+1))] :: $(date)"
  echo ""
  
  i=0
  iLen=${#envs[@]}
  
  while [ $i -lt $iLen ]; do
    env=${envs[$i]}
    
    j=0
    jLen=${#pjts[@]}
    
    while [ $j -lt $jLen ]; do
      pjt=${pjts[$j]}
      
      curl -sL -u "admin:<jenkins_admin_api_token>" "http://localhost:8085/job/$env-spo-$pjt/lastBuild/api/json?tree=result,url,timestamp" \
      | awk '{match($0, \"timestamp":[0-9]+/); ts=substr($0, RSTART+12, 10); dt=strftime("%Y-%m-%d %H:%M:%S", ts); sub(/"timestamp":[0-9]+/, "\"timestamp\":\"" dt "\"", $0); print }' \
      | sed 's/"_class":"org.jenkinsci.plugins.workflow.job.WorkflowRun",\s*//g'
      
      echo ""
      
      ((j++))
    done
    
    ((i++))
    
  done
  
  ((c++))
  
  sleep 1m
  
done

exit 1