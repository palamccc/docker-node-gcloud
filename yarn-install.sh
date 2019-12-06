#!/usr/bin/env bash
set -e
yarn config set cache-folder $PWD/.yarn
export FROM_GIT_URL="git.ssh://git"
export TO_GIT_URL="https://gitlab-ci-token:$CI_JOB_TOKEN"
sed -i "s#$FROM_GIT_URL#$TO_GIT_URL#" package.json yarn.lock
yarn --ignore-optional --pure-lockfile --prefer-offline