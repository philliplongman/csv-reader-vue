# CSV Reader

A full-stack technical challenge I took too seriously, with asynchronous Vue.js on the front end and Sinatra on the back.

### Requirement summary:

* Write a web app that will accept CSV files in three slightly different formats and display them as a sortable table.

[Try it here](https://csv-reader.herokuapp.com/) with one of the test files below.

Test files (right click then select, "Save link as"):
* <a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/comma.txt">Comma separated file</a>
* <a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/pipe.txt">Pipe separated file</a>
* <a href="https://github.com/philliplongman/fullstack-challenge-ruby/raw/master/spec/fixtures/space.txt">Space separated file</a>

## Design decisions

Since the project was so simple and didn't call for any persistence, I felt like it was a great case for Sinatra. I thought it would be fun to submit the files asynchronously and return data via JSON for a single page app, using Vue.js on the front end.

I used RSpec, Capybara, and Poltergeist for some basic testing. PhantomJS couldn't handle Vue, so I used Webpack and Babel to transpile so the tests would pass.

## Project info

To run:
```
bundle install
puma
```

To test:
```
rspec
```
