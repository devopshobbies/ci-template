#!/bin/sh

# logs docker information
docker info

# login to provided docker registry
docker login -u ${REGISTRY_USERNAME} -p ${REGISTRY_TOKEN} ${REGISTRY_ADDRESS}
    
docker load --input archived-build.tar

image="${REGISTRY_ADDRESS}/${REGISTRY_USERNAME}/${CI_PROJECT_NAME}:${CI_COMMIT_REF_SLUG}"

docker tag ${CI_PROJECT_NAME}:${CI_COMMIT_REF_SLUG} "$image"

docker push "$image"
