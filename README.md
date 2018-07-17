# Darknode UI and CLI

This is an internal tool used for generating and serving the Darknode Operator Dashboard and CLI files.

To generate the files for the UI and CLI, run:

    $ bash generateFiles.sh

> Note: you must have the `docker-machine` command-line tool installed. Visit https://docs.docker.com/machine/install-machine/ for more details.

Then after committing, to deploy to Heroku run the following:

    $ git push heroku-network master

where `network` is either `nightly`, `falcon`, or `testnet`.