# Full Stack Challenge

Since the project is so simple and doesn't call for any persistence, I felt like this was a great case for Sinatra. And since I didn't see any way to submit the form in the UI, I thought it would be fun to submit automatically and return the data via JSON for a single page app.

I used RSpec, Capybara, and Poltergeist for testing. I wrote a basic feature test to cover parsing the different formats and sorting the table and some helper methods to improve test readability.

## Lessons

Both Sinatra and AJAX may have been a little overambitious for such a small challenge. I always forget that Sinatra is going to be fewer files but a lot more effort than Rails. Submitting and returning the data asynchronously also made extra work and added nuances to the table sorting that had to be accounted for. It made it harder to find a table sorting library—and the one I chose has a bug that I struggled with.

If I were to work on this for another day, I would try to implement Vue.js, which I think would work really well here. But since this already took so long, I just wrapped up the JavaScript in the class pattern I'm most used to writing.

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
