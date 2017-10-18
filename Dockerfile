#
# Docker Database Migrate Tool for Ghost Blog
#

#Build step for Ghost Image
FROM node:6.10 as ghost-builder
RUN npm install --loglevel=error -g knex-migrator ghost-cli

ENV GHOST_VERSION 1.14.1
RUN addgroup --system -gid 1276 ghost && \
    adduser --system --home /ghost --ingroup ghost --uid 1276 ghost && \
    mkdir /ghost/blog && \
    cd /ghost/blog && \
    ghost install $GHOST_VERSION --local && \
    echo $GHOST_VERSION > /ghost/version

COPY run-ghost.sh /ghost
COPY migrate-database.sh /ghost

COPY config.production.json /ghost/blog

COPY MigratorConfig.js /ghost/blog

#Create the Docker Ghost Blog
FROM node:6.11.3-alpine
LABEL maintainer="Marco Mornati <marco@mornati.net>"

# Install Ghost
RUN addgroup -S -g 1276 ghost && \
    adduser -S -h /ghost -G ghost -u 1276 ghost

COPY --from=ghost-builder /ghost /ghost
RUN chown -R ghost:ghost /ghost && \
    mkdir /ghost-override && \
    chown -R ghost:ghost /ghost-override

RUN npm install --loglevel=error -g knex-migrator

USER ghost
ENV HOME /ghost

# Define working directory.
WORKDIR /ghost

# Set environment variables.
ENV NODE_ENV production

# Define mountable directories.
VOLUME ["/ghost-override"]

# Define default command.
CMD ["/bin/sh", "/ghost/migrate-database.sh"]
