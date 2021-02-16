#!/usr/bin/env bash

#export IMAGE_NAME="${REGISTRY}/${REPOSITORY}"
echo "${SECRET}" | docker login -u "${USER}" --password-stdin https://${REGISTRY}
docker build -f Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .
docker push ${IMAGE_NAME}:${IMAGE_TAG}
docker logout https://${REGISTRY}
