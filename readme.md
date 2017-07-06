# CSV Reader

A full-stack technical challenge I took too seriously, with asynchronous Vue.js on the front end and Sinatra on the back.

([Also with an Elixir Phoenix back end](https://github.com/philliplongman/csv-reader-elixir))

### Requirement summary:

* Write a web app that will accept CSV files in three slightly different formats and display them as a sortable table.

[Try it here](https://csv-reader.herokuapp.com/) with one of the test files below.

Test files (right click then select, "Save link as"):
* [Comma separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-vue/master/spec/fixtures/comma.txt)
* [Pipe separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-vue/master/spec/fixtures/pipe.txt)
* [Space separated file](https://raw.githubusercontent.com/philliplongman/csv-reader-vue/master/spec/fixtures/space.txt)

## Design decisions

Since the project was so simple and didn't call for any persistence, I felt like it was a great case for Sinatra. I thought it would be fun to submit the files asynchronously and return data via JSON for a single-page app, using Vue.js on the front end.

I used RSpec, Capybara, and Poltergeist for some basic testing. PhantomJS couldn't handle Vue, so I used Webpack and Babel to transpile down so the tests would pass.

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
