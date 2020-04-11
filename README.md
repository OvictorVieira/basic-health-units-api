# Basic Health Units API

The API documentation is available by [Clicking here](https://documenter.getpostman.com/view/10569183/SzYgRv7S?version).

#### Preparing the Development Environment

To install the Development Environment, access the [Docker Readme](docker/README.md) and follow the instructions.

##### Database

The application uses the Postgres database, so to use the project it is necessary
the creation of a **Server** in PgAdmin, for this follow the commands below:

* Access the local [Pgadmin](http://localhost:16543);
* To access, use the data below:
* User: user@gmailcom
* Password: BhU2020!

![Logging into PGAdmin](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Flogin%20no%20pgadmin.png?alt=media&token=240b4574-34b7-4a87-80f4-d02c64866601)

* Create a server and enter a name for it as shown below:

![Server Creation in PGAdmin](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fpg%20admin%20create%20server.png?alt=media&token=27c046f1-450c-4b99-9d7c-42bff439bcec)

* In the **Conections** tab, create a connection as shown in the image below:

![Connection Creation in PGAdmin](https://firebasestorage.googleapis.com/v0/b/images-d10d2.appspot.com/o/basic-health-units%2Fpg%20admin%20connections.png?alt=media&token=df70fb5e-b310-4689-8577-a989fb51b259)

* User: user
* Password: BhU2020!

**PS.:** *All passwords and users are for Local / Development use*

## Project Architecture

#### Technologies

- Linguagem: Ruby 2.6.0
- Framework: Ruby on Rails 6.0.2.1
- Conteinerização: Docker
- Multiple Container Handling Tool: Docker Compose
- Relational database: PostgreSQL

#### Code Architecture

In the code architecture, the following structure was used:

* `app/crons`: There are files related to routines that will be executed via scheduling
* `app/policies`: There are the files related to the System Policies (business rules)
* `app/serializers`: There are files related to the data serialization classes that will be returned in the API.
* `app/services`: There are files related to communication with services external to the application, such as third party APIs.
* `app/utils`: There are files related to modules useful for the system.
* `app/workers`: Are the files related to the classes of the Workers that will be used to process in Sidekiq

The use of *Docker* and *Docker-compose* was adopted in the development environment because it streamlines the development process
and keeps the developer's machine integrated.

#### Gems used in the project

##### Production

* `active_model_serializers`: It was used to serialize the data on the return of the API.
* `sidekiq`: It was used to use Queues and Background processes.
* `httparty`: It was used to make REST requests.
* `devise`: It was used to authenticate users in the API.
* `simple_token_authentication`: It was used to work with *Devise*, performing user authentication in the API.
* `kaminari`: It was used to perform data pagination
* `geocoder`: It was used to perform data manipulation through geolocation
* `rack-cors`: It was used to solve an external access problem in the API via Web App

##### Development/Test

* `factory_bot_rails`: It was used to create Mocks in the tests.
* `faker`: It was used to create fictitious data in the Tests.
* `webmock`: It was used to create request mocks in tests.
* `vcr`: It was used to create Mocks of requests, not to perform them after creating the mocks.