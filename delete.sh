#!/usr/bin/env bash

USERNAME=$1
PASSWORD=$2

ORGANIZATION="shkant27"
IMAGE="nginx"

login_data() {
cat <<EOF
{
"username": "$USERNAME",
"password": "$PASSWORD"
}
EOF
}


TOKEN=`curl -s -H "Content-Type: application/json" -X POST -d "$(login_data)" "https://hub.docker.com/v2/users/login/" | jq -r .token`

IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${ORGANIZATION}/${IMAGE}/tags/?page_size=100 | jq -r '.results|.[]|.name')

count=0
for i in ${IMAGE_TAGS}
do
    if [ $count -gt 2 ]
    then
        echo "delete : ${i}"
        curl "https://hub.docker.com/v2/repositories/${ORGANIZATION}/${IMAGE}/tags/${i}/" \
        -X DELETE \
        -H "Authorization: JWT ${TOKEN}"
    else
        echo "dont delete : ${i}"
    fi

    count=`expr $count + 1`
done

