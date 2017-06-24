# Full Stack Challenge

Since the project is so simple and doesn't call for any persistence, I felt like this was a great case for Sinatra. And since I didn't see any way to submit the form in the UI, I thought it would be fun to submit automatically and return the data via JSON for a single page app.

I initially wrote the JavaScript using jQuery and Underscore.js. I transitioned some of the code to Vue.js, which made it much cleaner.

I used RSpec, Capybara, and Poltergeist for some basic testing, but using Vue.js broke the tests, because PhantomJS still can't handle ES6 and Selenium is broken since Firefox 48. Since the app works, it's not worth fixing.


## Project info

To run:
```
bundle install
npm run build
puma
```

To test (broken):
```
rspec
```
