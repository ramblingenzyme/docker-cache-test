#!/usr/bin/env bash
set -eou pipefail

git show main:package.json > main.package.json
git show main:yarn.lock > main.yarn.lock

docker build -f base.Dockerfile -t app-base:latest .

rm main.package.json main.yarn.lock