# Auroville Platform

Auroville Platform is an Elixir umbrella app designed to power the next version of
1. Auronet (auroville.org.in) - an intranet used by the residents of Auroville
2. Auroville Public Website (auroville.org)

This project is created as umbrella app to solve the overlapping needs of both these
web platforms.

## Architecture
We believe that the Elixir umbrella apps structure provide the best of the microservices
and the monolithic software worlds.

While monolithic software is hard to understand and maintain, it's easy to access any data
across the entire codebase. Microservices makes it easy to understand and maintain smaller
pieces of the larger monolith in separate codebases but introduces the problem of data access across
multiple services.

With Elixir umbrella apps, each user facing site is a separate Phoenix app residing inside the
`/apps` folder without any database (or Ecto layer). For all purpose of accessing the data, these
web apps rely on additional Ecto apps created in the `/apps` directory.

Since the data access layer is decoupled from the web interface, multiple web interfaces can
interact with the same database layer as in a monolith but provides a cleaner and modular way to
maintain the code as in microservices.


## Structure

`/apps/` - Holds all the micros apps

`/apps/auronet` - Phoenix app that will power the next version of Auronet.

`/apps/av_public` - Phoenix app that will power the next version of auroville.org

`/apps/av_data_store` - Ecto app that manages the business data and rules for booking rentable cycles.
