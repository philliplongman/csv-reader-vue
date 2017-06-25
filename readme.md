# Full Stack Challenge

A technical challenge I took too seriously.

## Requirement summary

Write a web app that will read CSV files in three slightly different formats (provided below) and display it in a sortable table.

<a href="/spec/fixtures/comma.txt" download>Comma separated file</a>
<a href="/spec/fixtures/pipe.txt" download>Pipe separated file</a>
<a href="/spec/fixtures/space.txt" download>Space separated file</a>

## Design decisions

Since the project was so simple and didn't call for any persistence, I felt like this was a great case for Sinatra. I thought it would be fun to submit the files asynchronously and return the data via JSON for a single page app, using Vue.js on the front end.

I used RSpec, Capybara, and Poltergeist for basic testing. Vue.js broke the the tests. I had to use Webpack and Babel to transpile down to ES5 so PhantomJS could handle them again.

## Project info

To run:
```
bundle install
npm install
npm run build
puma
```

To test:
```
rspec
```
