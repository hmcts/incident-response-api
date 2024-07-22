# incident-response-api

This is the backend for the incident response slack bot.

Based off work done in https://github.com/monzo/response

## Local development

### Slack app

You will need a slack app to be able to test this fully.

Create a new app to test and configure it with the values from https://github.com/hmcts/response/blob/master/docs/slack_app_create.md.

Back in your IDE, copy env-template file and rename it to .env and fill out the fields.

See https://github.com/hmcts/response/tree/master/demo#2-configure-the-demo-app for the values you need.

### Running the app locally

Use `docker compose up` to build the required docker containers and test the application.

You can reach the UI via `http://localhost:8000`

### Testing with the Slack app

In order to test your app works properly with Slack and its features like slash commands, it needs to be publicly reachable.

You can use a service called ngrok to make it reachable over the internet.

**Be careful when using this as it will expose the application to anyone. Only do this when necessary and remember to run `docker compose down` when finished.**

Sign up for an account with ngrok and obtain an API key and auth token.

Create a file called `.ngrok.yml` in your local repo with settings similar to this:

```
tunnels:
  httpbin:
    proto: http
    addr: response:8000
version: 2
authtoken: <YOUR AUTH TOKEN>
api_key: <YOUR API KEY>
web_addr: 0.0.0.0:8000
update: false
log: stdout
```

This file has been added to the gitignore so it does not get committed.

In the provided docker-compose.yaml file, there is an ngrok section that has been commented out.

Uncomment this section and run `docker compose up`.

Go to your ngrok account in your browser and click on `Endpoints`. There you will see your endpoint URL.

Update your slack app redirect URLs to your ngrok endpoint URL and add the appropriate endings e.g. `/slack/slash_command`, so you can test slash commands and other features.

**Ngrok endpoint URLs will regenerate every time you recreate the ngrok container**

Once you've done that, you can test the app from the slack desktop client using slash commands e.g. `/incident`.

### Checking the logs

To see the logs of your docker container you can run:

```
docker logs response -f
```

This will output the logs to your terminal and follow them so you can see what's happening in real time.

### Useful docker commands

`docker compose up -d` - builds the docker containers in the background so you don't have the logs taking over your terminal.
`docker compose up -d --build` - rebuilds the containers from scratch so they pick up changes you've made to your application or dockerfiles.

