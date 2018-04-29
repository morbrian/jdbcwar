# jdbcwar

Simple war with single index.html and jdbc enabled servlet, provides very simple skeleton framework.

Useful as a sandbox baseline for trying out functionality in isolation before migrating it
to another target application.

# Usage

Build with maven:

        mvn clean package
        
Build Docker container:

        mvn package docker:build
        
# Compose notes

When using compose, running the following command after docker:build will refresh the running container:

         docker-compose up -d --no-deps --force-recreate jdbcwar
