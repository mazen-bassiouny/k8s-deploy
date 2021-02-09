#!/usr/bin/env bash

export IMAGE_NAME="${REGISTRY}/${REPOSITORY}"
echo "${LOGIN_SECRET}" | docker login -u "${LOGIN_USER}" --password-stdin https://${REGISTRY}
docker build -f Dockerfile -t ${IMAGE_NAME}:${FIRST_TAG} .
docker tag ${IMAGE_NAME}:${FIRST_TAG} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}:${FIRST_TAG}
docker push ${IMAGE_NAME}:latest
docker logout https://${REGISTRY}
