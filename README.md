# incident-response-api

This is the backend for the incident response slack bot.

Based off work done in https://github.com/monzo/response

## Local development

Copy env-template to .env and fill out the fields, see https://github.com/monzo/response/tree/master/demo#2-configure-the-demo-app

Use `docker compose up` to build the required docker containers and test the application.

When running locally, you can use ngrok to make it reachable over the internet.

Be careful when using this as it will expose the application to anyone. Only do this when necessary and remember to run `docker compose down` when finished.

You will need to sign up for an account with ngrok and obtain an API key and auth token.

You will need to create a file called `.ngrok.yml` in your local repo with settings similar to this:

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

Update your slack app redirect URLs to your ngrok endpoint so you can test slash commands and other features.

**Ngrok endpoint URLs will regenerate every time you recreate the ngrok container**

