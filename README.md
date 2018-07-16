# Darknode UI and CLI

This is a tool used for generating and serving the Darknode Operator Dashboard and CLI files.

First clone the repository and initialize the submodules by running:

    $ git clone [url]
    $ cd darknode-proxy-go
    $ git submodule update --init

To generate the files for the UI and CLI, run:

    $ bash generateFiles.sh

> Note: you must have the `docker-machine` command-line tool installed. Visit https://docs.docker.com/machine/install-machine/ for more details.
