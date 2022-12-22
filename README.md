# README

## Getting started

- `bundle install`
- `bin/rake db:migrate`
- `bin/dev`
- Go to `localhost:3000`

## Technical Decisions

### Framework (Rails)

I've not used Rails too much in the past, however I have used other similar frameworks extensively (e.g. Laravel). If this was a true personal MVP I would probably choose something like Firebase or Pocketbase which provides (almost) an entire backend out of the box.

Since this is a technical task I think Rails gives a good balance between productivity while still enabling me to write _some_ code. (And I know Dentally uses some Ruby/Rails internally, which is why I chose it over PHP/Laravel).

### Authentication (None)

I decided to skip authentication / authorization entirely. Given it is the same for just about every app, I'd likely outsource this to either:
 - A third party library, e.g Devise
 - A third party service, e.g. Auth0, Firebase or AWS Cognito which comes with lots of bells and whistles out of the box

### Database (Postgres and SQLite)

Locally, and when running integration tests I use a SQLite DB, for speed and simplicity. In the production deployment I use a Postgres DB. For this app they are similar enough, but of course could run into issues where the app behaves differently when using SQLite vs Postgres.

I think Postgres is a great DB, with loads of features that end up being useful in an app (I use it as the Rails websocket driver later also). (https://www.amazingcto.com/postgres-for-everything/).

If we really needed global scale and BASE was OK for this, I might consider a NoSQL DB.

### Javascript

There is very little JS used in this app. The JS that is used is done via progressive enhancement, meaning the app works perfectly without JS enabled. When JS is enabled, functionality is not blocked waiting for the JS to download and execute.

### Styling (Tailwind)

I chose TailwindCSS for a CSS framework, just to provide a sensible colour palette and utilities out of the box.

### API (Rest vs GraphQL)

I just used a simple Rest API, I find GraphQL almost always overkill, doubly so for an app this small!

### Realtime (ActionCable)

Whenever a new question is added, a yellow banner will be shown asking the user to refresh to update the question list. This is achieved using websockets via the ActionCable Rails library. 

This could also be added to answers, and the quetions could be inserted automatically instead of the user having to refresh the page.


### Testing

There are endpoint tests included (from scaffolding out the controllers). Ideally, I'd like to add a browser test for at least one flow, in the JS world I'd use Cypress or Playwright, I guess these would work just as well for Rails! 

### Hosting

Hosted on Heroku, you can view it [here](https://fathomless-garden-91108.herokuapp.com/questions).

### Deploymnent

A simple Github Actions pipeline that runs tests before a Heroku hook deploys (and Heroku will not deploy if tests fail).

### Further Improvements

#### Pagination

Currently, only the 10 latest questions are shown, I'd like to add pagination to show more.
