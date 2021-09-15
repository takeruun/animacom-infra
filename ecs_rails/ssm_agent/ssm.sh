output=`aws ecs list-tasks --cluster animacom-cluster | jq ".taskArns[0]"`
task=`echo $output | jq -r`

echo $task

aws ecs execute-command \
--cluster animacom-cluster \
--container animacom_api \
--task $task \
--command "ash" \
--interactive