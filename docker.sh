#!/bin/bash

DOCKER_NAME=fe-mono
VERSION=v0.0.1
TEST_VERSION=test
DOCKER_HUB=mirrors.tencent.com/fe-mono/efd-frontend

# 生产环境 build
function buildPrd() {
  docker build -f Dockerfile.pc . -t ${DOCKER_NAME}:${VERSION}
  echo "==== build done: ${DOCKER_NAME}:${VERSION} ===="
}

# 测试环境 build
function buildStg() {
  docker build -f Dockerfile.stg . -t ${DOCKER_NAME}:${TEST_VERSION}
  echo "==== build done: ${DOCKER_NAME}:${TEST_VERSION} ===="
}

# 打tag
function tag() {
  sudo docker tag ${DOCKER_NAME}:${VERSION} 	${DOCKER_HUB}:${VERSION}
  echo "==== tag: ${DOCKER_NAME}:${VERSION} -> 	${DOCKER_HUB}:${VERSION} ===="

}

# 推送当前tag镜像到仓库
function push() {
  sudo docker push ${DOCKER_HUB}:${VERSION}
  echo "==== push: ${DOCKER_HUB}:${VERSION} ===="

}

# 正式发布镜像 (tag:latest）
function release() {
  sudo docker tag ${DOCKER_NAME}:${VERSION} 	${DOCKER_HUB}:${VERSION}
  echo "==== tag latest: ${DOCKER_NAME}:${VERSION} -> 	${DOCKER_HUB}:${VERSION} ===="


  sudo docker push ${DOCKER_HUB}:${VERSION}
  echo "==== push latest: ${DOCKER_HUB}:${VERSION} ===="

}


# 正式发布镜像 (tag:latest）
function releaseStg() {
  sudo docker tag ${DOCKER_NAME}:${TEST_VERSION} 	${DOCKER_HUB}:${TEST_VERSION}
  echo "==== tag latest: ${DOCKER_NAME}:${TEST_VERSION} -> 	${DOCKER_HUB}:${TEST_VERSION} ===="


  sudo docker push ${DOCKER_HUB}:${TEST_VERSION}
  echo "==== push latest: ${DOCKER_HUB}:${TEST_VERSION} ===="

}

case "$1" in
    build)
        buildPrd
        ;;
    build-stg)
        buildStg
        ;;
    tag)
        tag
        ;;
    push)
        push
        ;;
    release-stg)
        releaseStg
        ;;
    release)
        release
        ;;
    *)
        build
        ;;
esac
exit 0