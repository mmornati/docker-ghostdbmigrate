#
# Docker Database Migrate Tool for Ghost Blog
#
FROM mmornati/docker-ghostblog:1.16.2
LABEL maintainer="Marco Mornati <marco@mornati.net>"

RUN cd $GHOST_INSTALL && npm install --loglevel=error knex-migrator

COPY migrate-database.sh $GHOST_INSTALL
COPY MigratorConfig.js $GHOST_INSTALL

# Define default command.
CMD ["/bin/sh", "-c", "/bin/sh ${GHOST_INSTALL}/migrate-database.sh"]
