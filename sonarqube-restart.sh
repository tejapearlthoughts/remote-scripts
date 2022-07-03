attempt_counter=0
max_attempts=20
echo "Starting .."
isUp() {
  curl -s -u admin:admin -f "http://sonarqube:9000/api/system/info"
}
# Wait for server to be up
PING=`isUp`
while [ -z "$PING" ]
do
  echo "Retrying ..."
  sleep 5
  PING=`isUp`
  maxRetries=$(($attempt_counter+1))
  if [ ${attempt_counter} -eq ${max_attempts} ];then
    echo "Max retries reached"
    break
  fi
done
