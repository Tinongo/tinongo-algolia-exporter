# README

Small Ruby script to export an Algolia index.


## Installation / Setup

1. Clone the repository
2. run `bundle install`
3. run `ruby main.rb`


### Environment vars

The app needs the following environment variables to be set. Create a `local_env.yml` file:

```yaml
# local_env.yml

# Add settings and API keys here.
# This file should be listed in .gitignore to keep your settings secret!
# Each entry gets set as a local environment variable.
# This file overrides ENV variables in the Unix shell.
# For example, setting:
# GMAIL_USERNAME: 'Your_Gmail_Username'
# makes 'Your_Gmail_Username' available as ENV["GMAIL_USERNAME"]


##
# Algolia
##

ALGOLIA_APP_ID: '{keep_secret}'
ALGOLIA_API_KEY: '{keep_secret}'
```
