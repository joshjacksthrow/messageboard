# README

## Getting started

- `bundle install`
- `bin/rake db:migrate`
- `bin/dev`
- Go to `localhost:3000`

## Technical Decisions

### Choice of framework (Rails)

I've not used Rails in some time, however I have used other similar frameworks extensively (e.g. Laravel). If I was making a true personal MVP I would probably choose something like Firebase or Pocketbase which provides (almost) an entire backend out of the box.

But since this is a technical task I think Rails gives a good balance between productivity while still enabling me to show some skills. (And I know Dently uses some Ruby/Rails internally, which is why I chose it over PHP/Laravel).

The biggest downside I found, using Rails, is there are lots of auto-generated helpers and "magic" happening that makes errors slow to debug if not familiar and comfortable with Rails.

### Authentication

I decided to skip authentication / authorization entirely. Given it is the same for just about every app, I'd likely outsource this to either

 - A third party library like Devise
 - A third party service like Auth0, Firebase or AWS Cognito which comes with lots of bells and whistles out of the box

### Database

Just using SQLite for this small low-volume demo.

### Javascript

I kept the Javascript on this one minimal.

#### Pros
- Works on browsers without JS.
- On browsers with JS the user can use a fully functioning version of the app before the JS has downloaded and executed.
- All browser functionality works as expected and is not hijacked in any way
#### Cons
- As the project grows and more engineers come on board, having a JS framework that allows for easy componentisation would likely be beneficial.
- Not an SPA so will feel less 'app' like to the end user.
- 

If we were to change to an SPA I would likely split this into a different repository and host it statically somewhere. Then use Rails purely as an API.

### Styling

I chose TailwindCSS for a CSS framework, just to provide a sensible colour palette and utilities out of the box.

### Accessibility

### API (Rest vs GraphQL)

I just used a simple Rest API, I find GraphQL almost always overkill, especially for an app this small!

### Realtime

I used websocket for realtime updates of the feed. I think polling likely would have worked fine here but...


### Validation

<!-- Realtime feedback -->

### Mobile


### Testing

I included a single E2E test using Puppeteer just to demonstrate how I would do this in real life.

### Hosting

Hosted [on Heroku](https://fathomless-garden-91108.herokuapp.com/questions).

Since this is on a single instance, if there is any downtime, it will be user-impacting. In a real world scenario, I would have multiple instances and do some form of auto-healing and blue-green deploy.

Since the DB is hosted on this one instance, if there is any issue with the storage then data will be irrecoverably lost. In the real world, would host the DB with read-replicas to prevent downtime and take automatic snapshots for data recovery.****

### Deploymnent

A simple Github Actions pipeline that runs tests before a Heroku hook deploys

### Further Improvements

#### Pagination