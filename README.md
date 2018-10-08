# Sinatra Kennel HW


## Instructions


1. Clone.

2. Run `bundle install`

3. Finish Part 1 and Part 2

4. Commit all changes and push to Github

   ​


### Part 1 Instructions


1. Make requests to GET `/dogs` display a line for each dog in the database with the following format: `id: name - breed - weight`
2. Make requests to POST `/dogs` create a new dog where the name, breed, and weight of the dog to be created are grabbed from parameters `name`, `breed`, and `weight` respectively.
3. Make requests to PATCH `/dogs` update the information for an existing dog, when given new information (from the parameters) and the id of the dog to update (from the parameters).
4. Make requests to DELETE `/dogs` delete an existing dog from the database (if it exists) when given the id of the dog to delete.
5. Run tests with: `bundle exec rspec spec/part1_spec.rb`

### Part 2 Instructions

1. Make sure POST requests to `/dogs` don't make a new dog unless the name, breed, and weight parameters are all set.
2. Make sure PATCH requests to `/dogs` work as long as the parameter `id` is provided and at least one other parameter (name, breed, or weight).
3. Make sure DELETE requests to `/dogs` don't delete anything if the parameter `id` is not specified or the dog is not found in the database.
4. Run tests with: `bundle exec rspec spec/part2_spec.rb`


