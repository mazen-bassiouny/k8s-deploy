#!/usr/bin/env bash

export IMAGE_NAME="${REGISTRY}/${REPOSITORY}"
echo "${LOGIN_SECRET}" | docker login -u "${LOGIN_USER}" --password-stdin https://${REGISTRY}
docker build -f Dockerfile -t ${IMAGE_NAME}:${DEV_TAG} .
docker push ${IMAGE_NAME}:${DEV_TAG}
docker logout https://${REGISTRY}
