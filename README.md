# Sample Twitter App

This project builds a Twitter-style app in Rails following the [Rails Tutorial book](https://www.railstutorial.org/book) by [Michael Hartl](http://www.michaelhartl.com/).

## To run this app locally
To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```