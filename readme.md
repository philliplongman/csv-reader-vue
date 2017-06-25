# Full Stack Challenge

A technical challenge I took too seriously.

### Requirement summary

Write a web app that will read CSV files in three slightly different formats (provided below) and display them in a sortable table.

<a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/comma.txt" download>Comma separated file</a></br>
<a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/pipe.txt" download>Pipe separated file</a></br>
<a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/space.txt" download>Space separated file</a>

### Design decisions

Since the project was so simple and didn't call for any persistence, I felt like this was a great case for Sinatra. I thought it would be fun to submit the files asynchronously and return the data via JSON for a single page app, using Vue.js on the front end.

I used RSpec, Capybara, and Poltergeist for basic testing. PhantomJS can't handle ES2015 JavaScript, so Vue broke the the tests. I used Webpack and Babel to transpile down to ES5 so they could pass again.

### Project info

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
