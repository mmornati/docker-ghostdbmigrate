##DEPRECATED##
There is no need anymore for this image. Knex migration tool is already contained into the ghost base installation and it is actually automatically run by the ghost base image.

[![Build Status](https://travis-ci.org/mmornati/docker-ghostdbmigrate.svg)](https://travis-ci.org/mmornati/docker-ghostdbmigrate)[![](https://images.microbadger.com/badges/image/mmornati/docker-ghostdbmigrate.svg)](https://microbadger.com/images/mmornati/docker-ghostdbmigrate "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/mmornati/docker-ghostdbmigrate.svg)](https://microbadger.com/images/mmornati/docker-ghostdbmigrate "Get your own version badge on microbadger.com")


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
docker run -it --rm --name blogmigrate -e NODE_ENV=production -e DB_CURRENT_VERSION=1.0.2 -v /Users/mmornati/ghost-blog-test:/ghost-override mmornati/docker-ghostdbmigrate:v1.8.6
```

You have to change:
* -v parameter to point to your external/database path
* DB_CURRENT_VERSION variable with the version of ghost you use before the upgrade.
