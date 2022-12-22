# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

## Technical Decisions

### Choice of framework (Rails)

I've not used Rails in some time, however I have used other similar frameworks extensively (e.g. Laravel). If I was making a true personal MVP I would probably choose something like Firebase or Pocketbase which provides (almost) an entire backend out of the box.

But since this is a technical task I think Rails gives a good balance between productivity while still enabling me to show some skills. (And I know Dently uses some Ruby/Rails internally, which is why I chose it over PHP/Laravel)

### Authentication

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

### Realtime

I used websocket for realtime updates of the feed. I think polling likely would have worked fine here but...

### File Storage

### Validation

<!-- Realtime feedback -->

### Mobile


### PWA

### Testing

I included a single E2E test using Puppeteer just to demonstrate how I would do this in real life.

### Webserver

Using Puma, if this were a higher traffic app
### Hosting

Hosted at ____ on a simple digital ocean droplet.
### Environments

### Deploymnent

A simple Github Actions pipeline that tests, lints and deploys 

### Further Improvements

#### Pagination