#!/bin/sh
CONFIG="$GHOST_INSTALL/MigratorConfig.js"
GHOST_VERSION=`cat $GHOST_INSTALL/version`
if [ -z "$DB_SQLITE_PATH" ]; then
        echo "DB_SQLITE_PATH is empty. Getting default: $GHOST_CONTENT/data/ghost-local.db"
        DB_SQLITE_PATH=$GHOST_CONTENT/data/ghost-local.db
fi

sed -i "s|__DB_SQLITE_PATH__|$DB_SQLITE_PATH|g" $CONFIG
sed -i "s|__DB_CURRENT_VERSION__|$DB_CURRENT_VERSION|g" $CONFIG
sed -i "s|__GHOST_NEW_VERSION__|$GHOST_VERSION|g" $CONFIG

echo "Executing using the following MigratorConfig.js file"
cat $CONFIG

/bin/sh $GHOST_INSTALL/run-ghost.sh -d
cd $GHOST_INSTALL && node_modules/knex-migrator/bin/knex-migrator migrate
