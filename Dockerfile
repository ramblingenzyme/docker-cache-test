ARG NODE_VERSION=16.13.0
FROM node:${NODE_VERSION}-bullseye-slim as base_build

COPY main.package.json ./package.json
COPY main.yarn.lock ./yarn.lock
RUN yarn install --frozen-lockfile --non-interactive

FROM node:${NODE_VERSION}-bullseye-slim

COPY --from=base_build /usr/local/share/.cache/yarn/v6 /usr/local/share/.cache/yarn/v6

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --non-interactive