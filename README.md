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

### Database (SQLite)

Just using SQLite for this small low-volume demo. For a larger app, I'd generally choose Postgres since it comes with pretty much everything needed in a DB. (https://www.amazingcto.com/postgres-for-everything/).

If I really needed global scale and BASE was OK for this, I might consider a NoSQL DB.

### Javascript

There is almost no JS for this app.

#### Pros
- Even on browsers with JS the user can use a fully functioning version of the app before the JS has downloaded and executed.
- All browser functionality works as expected and is not hijacked in any way
#### Cons
- As the project grows and more engineers come on board, having a JS framework that allows for easy componentisation would likely be beneficial.
- Not an SPA so will feel less 'app' like to the end user.

If we were to change to an SPA I would likely split the frontend into a different repository and host it statically somewhere. Then use Rails purely as an API.

### Styling (Tailwind)

I chose TailwindCSS for a CSS framework, just to provide a sensible colour palette and utilities out of the box.

### API (Rest vs GraphQL)

I just used a simple Rest API, I find GraphQL almost always overkill, doubly so for an app this small!

### Realtime (Websockets)

I used websocket for realtime updates of the feed. 


### Testing

There are endpoint tests included (from scaffolding out the controllers). Ideally, I'd like to add a browser test for at least one flow. 

### Hosting

Hosted on Heroku, you can view it [here](https://fathomless-garden-91108.herokuapp.com/questions).

Since this is on a single instance, if there is any downtime, it will be user-impacting. In a real world scenario, I would have multiple instances and do some form of auto-healing and blue-green deploy.

Since the DB is hosted on this one instance, if there is a storage failure then data will be irrecoverably lost (and is irrecoverable lost on every deploy, which wouldn't be ideal in real life!!). In the real world, would host the DB with read-replicas to prevent downtime and take automatic snapshots for data recovery.

### Deploymnent

A simple Github Actions pipeline that runs tests before a Heroku hook deploys (and Heroku will not deploy if tests fail).

### Further Improvements

#### Pagination

Currently, only the 10 latest questions are shown, I'd like to add pagination to show more.