# Basic Health Units API

This project has a folder called "docker",
there is a file called `docker-compose.yml` which is
responsible for building the complete development environment for the project.

#### Install Docker and Docker-Compose

To use the environment that was designed using the `Docker` containers
you need to have `docker` and` docker-compose` installed on your machine,
thus, avoiding any conflicts and difficulties in raising the environment and the project.

- [Install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Install Docker-Compose](https://docs.docker.com/compose/install/#install-compose)

#### Using Docker

When cloning the project, simply access the `basic-health-units` project folder and run the setup script below:

``
    $ cd basic-health-units/docker/
    $ bash ./docker-setup.sh
``

Then, inside the Container, execute the following commands:

``
   $ cd docker/
   $ bash ./application-setup.sh
``

And to work on a daily basis, use the command below:

``
   $ docker exec -it basic-health-units bash
``

The following containers will be made available:

* **basic-health-units**: Application container with Ruby and the Ruby on Rails framework.
* **pgadmin**: PgAdmin Container, Tool for PostgreSQL Database Manipulation
* **postgres**: PostgreSql Database Container
* **portainer**: Container Portainer, to manage Local Containers
* **redis**: Redis container, used next to the sidekiq

#### Configuring the Container Manager

After executing the commands above, your environment will be ready.

To view and manipulate the containers, access [Portainer](localhost:9000) and follow the images below:
 
* Create a username and password:

![Creating username and password in Portainer](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fcreate%20user%20portainer.png?alt=media&token=125c5d5e-d11b-4ee3-9815-f17b007ee116)

* Click on the first option to configure the local connection:

![Configuring option to configure the local connection](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fportainer%20parte%202.png?alt=media&token=89ff7d82-5313-4739-ae02-daaf4c8135eb)

* Click on the button `Local`:

![Accessing local containers](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Faccess%20containers.png?alt=media&token=668f860b-ab4b-4f6d-aad6-a3e706fc2b70)

* Click on `Containers`:

![Accessing containers](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fselect%20containers.png?alt=media&token=07f726f8-d890-42b9-a479-3214cc30d8c0)

* List of local containers:

![List of local containers](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fcontainers%20list.png?alt=media&token=d2c4ae6d-54e6-49c7-96d8-dffcd90262e0)