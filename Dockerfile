ARG NODE_VERSION=16.13.0
FROM node:${NODE_VERSION}-bullseye as base_build

COPY main.package.json ./package.json
COPY main.yarn.lock ./yarn.lock

RUN yarn install --frozen-lockfile --non-interactive

FROM base_build

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --non-interactive