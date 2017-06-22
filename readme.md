# Full Stack Challenge

Since the project is so simple and doesn't call for any persistence, I felt like this was a great case for Sinatra. And since I didn't see any way to submit the form in the UI, I thought it would be fun to submit automatically and return the data via JSON for a single page app using Vue.js.

I used RSpec, Capybara, and Poltergeist for testing. I wrote a basic feature test to cover parsing the different formats and sorting the table and some helper methods to improve test readability.


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
