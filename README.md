# TWITTER MONITOR

## Settings
Configure database and API credential in file `.env` (copy .env.sample)

## Run app in development
After clone repository, run on console

```
bundle install
yarn install
rake db:create db:migrate db:seed
rails s
```

## Tests
Run all tests
```
rspec
```

## Online
This app is available online in https://app-twitter-monitor.herokuapp.com/