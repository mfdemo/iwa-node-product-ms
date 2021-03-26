# IWA (Insecure Web App) Pharmacy Direct - Product Microservice

#### Table of Contents

*   [Overview](#overview)
*   [Forking the Repository](#forking-the-repository)
*   [Building the Application](#building-the-application)
*   [Running the Application](#running-the-application)
*   [Developing and Contributing](#developing-and-contributing)
*   [Licensing](#licensing)

## Overview

This is an example microservice providing product information for _IWA (Insecure Web App) Pharmacy Direct_.

## Forking the Repository

In order to execute the example scenarios described here you will need to "fork" a copy of this repository into
your own GitHub account. The process of "forking" is described in detail in the [GitHub documentation](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) - you can start the process by clicking on the "Fork" button at the top right.

## Building the Application

Before running the application you will need to install the required node module dependencies using:

```
npm install --no-save
```

## Running the Application

You will need a MySQL database to connect to, you can either using an existing MySQL instance and execute the script [etc\create.sql](etc\create.sql)
or use the provided [docker-compose.yml](docker-compose.yml) file to bring up a new MySQL instance using Docker, e.g.

```
docker-compose -f stack.yml up
```

You can run the application (in development mode) using:

```
node server.js
```

The application will then be available on the default port at http://localhost:8080/api/products.

## Developing and Contributing

Please see the [Contribution Guide](CONTRIBUTING.md) for information on how to develop and contribute.

If you have any problems, please consult [GitHub Issues](https://github.com/mfdemo/iwa-node-products-ms/issues) to see if has already been discussed.

## Licensing

This application is made available under the [GNU General Public License V3](LICENSE)