# Sinatra Blog API HW


## Instructions


1. Clone.

2. Run `bundle install`

3. Make sure you complete objectives by testing on Postman

4. Make sure you pass all tests

4. Commit all changes and push to Github

   ​


### Part 1 - Local


1. Make requests to GET `/posts` display JSON representing all posts in the database
2. Make requests to POST `/posts` create a new post where the title and body of the post to be created are grabbed from parameters `title` and `body`, respectively.
3. Make requests to PATCH `/posts` update the information for an existing post, when given new information (from the parameters) and the id of the post to update (from the parameters).
4. Make requests to DELETE `/posts` delete an existing post from the database (if it exists) when given the id of the post to delete.
5. Run tests with: `bundle exec rspec spec/posts_spec.rb`
6. Deploy to Heroku



### Part 2 - Deploying to Heroku

1. Add all your changes on git and make a commit: `git add .` + `git commit -m "Finished"`
2. Create a Heroku server: `heroku create`
3. Create a database for your server: `heroku addons:create heroku-postgresql:hobby-dev`
4. Push the code to Heroku: `git push heroku master`
5. I preconfigured the necessary files for this to work.
6. Verify all is working and submit your links (github and heroku) to me.