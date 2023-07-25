# CS6400-2023-01-Team107

## Members

-   Julia Lee
-   Steve Nganga
-   Nikhil Palli

## Run Alternakraft

### Dependencies

-   Install docker on your machine and make sure it's running.

### Prerequisites

-   Set current working directory to the root of this repository.
-   Type `ls` to make sure you see `docker-compose.yml` in the list of files.

### Build

-   Run `docker compose build` to build our solution.
-   Once built, you need not to run the build again, unless there have been code changes made.

### Run

-   Start the containers in the background by running `docker compose up -d`
-   Navigate to `http://localhost:3000/` to view the landing page of our app.

### Stop Containers

-   To stop containers from running in the backround, run `docker compose down`
