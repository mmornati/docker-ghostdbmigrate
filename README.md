# docker-ghostdbmigrate
This Docker can be used to migrate the Ghost Blog database from a newer version.

### Installation

#### Building by yourself

```bash
git clone https://github.com/mmornati/docker-ghostdbmigrate.git
cd docker-ghostdbmigrate
docker build -t mmornati/docker-ghostdbmigrate .
```

#### From DockerHub

```bash
docker pull mmornati/docker-ghostdbmigrate
```

### Usage

```bash
docker run -it --rm --name blogmigrate -e NODE_ENV=production -e DB_CURRENT_VERSION=1.0.2 -v /Users/mmornati/ghost-blog-test:/ghost-override mmornati/docker-ghostblog:v1.5.0 /ghost/migrate-database.sh
```

You have to change:
* -v parameter to point to your external/database path
* DB_CURRENT_VERSION variable with the version of ghost you use before the upgrade.
