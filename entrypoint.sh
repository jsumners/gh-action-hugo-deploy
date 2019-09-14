#!/bin/bash

set -ex

DEST_DIR="${HOME}/dest_repo"
DEST_URL="https://x-access-token:${INPUT_DESTINATION_TOKEN}@github.com/${INPUT_DESTINATION_REPO}.git"

git clone --depth=1 --single-branch --branch master \
  ${DEST_URL} \
  ${DEST_DIR}

WORK_DIR="${GITHUB_WORKSPACE}/${GITHUB_REPOSITORY}"

echo 'Contents of workspace'
ls ${GITHUB_WORKSPACE}
echo 'Contents of WORK_DIR'
ls ${WORK_DIR}

echo 'Building'
${INPUT_BUILD_CMD}
echo 'Contents of WORK_DIR'
ls ${WORK_DIR}

cp -R \
  ${GITHUB_WORKSPACE}/${GITHUB_REPOSITORY}/${INPUT_BUILD_DIR}/* \
  ${DEST_DIR}
cp -R \
  ${GITHUB_WORKSPACE}/${GITHUB_REPOSITORY}/${INPUT_BUILD_DIR}/.* \
  ${DEST_DIR}

cd ${DEST_DIR}
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add --all
git commit -m "Automated deployment: $(date -R) ${GITHUB_SHA}"
git push

bash
