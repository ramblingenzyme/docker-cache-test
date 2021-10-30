ARG NODE_VERSION=16.13.0
FROM node:${NODE_VERSION}-bullseye-slim

COPY --from=app-base:latest /usr/local/share/.cache/yarn/v6 /usr/local/share/.cache/yarn/v6

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --non-interactive