#!/usr/bin/env bash
set -eou pipefail

git show main:package.json > main.package.json
git show main:package.json > main.package.json

docker build --target base_build -t app-base:latest .

rm main.package.json main.yarn.lock