# Vox Pupuli Open PRs

A simple Sinatra APP to check open Pull Requests the Vox Pupuli namespace.

It's heavily based on the [junkie](https://github.com/leomilrib/junkie) app. It's awesome, go check it out!

## Using it
You can use it by [accessing the herokuapp](http://voxpupuli-open-prs.herokuapp.com/).

## Getting your own
You can run it on your machine or sever by follwing this steps:

### Running locally
 - `git clone <this repo>`
 - `bundle install`
 - config your `~/.netrc` file to include your GitHub authentication token:
 ```
 machine api.github.com
  login janedoe
  password hunter2
 ```
 -  `bundle exec ruby app.rb`

### Running on a Heroku app
 - [Get a GitHub API token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
 - `git clone <this repo>`
 - `bundle install`
 - `git remote add heroku <<Your Heroku app URL>>`
 - `heroku config:set OPEN_PR_ACCESS_TOKEN=<<Add your Github Access Token to Heroku app>>`
 - `git push heroku master`
 - `heroku open`

## Contributing
See the [contributing guide](CONTRIBUTING.md).
