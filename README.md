# Hello World Sinatra HW


## Instructions


1. Clone.

2. Run tests with: `rspec spec/part1_spec.rb`

3. Make the `http://localhost:4567/` url say `Hello World`

4. Make the `http://localhost:4567/?name=Eric` url say `Hello Eric`

5. Notice the route `get '/ask_name'` it is supposed to be a url that shows a form that lets you type your name in the box so the app can tell you hello. Only problem is the template it uses was never finished. Modify the  `views/ask_name.erb` template to have a form where the:

   1. form action attribute is set to "/"
   2. form has a textbox with an attribute name of "name"
   3. form has a submit button

6. Verify that you did this correctly by submitting the form. It should say hello to whatever you put in the box. (Make sure you restart the server to reload new changes)

7. Commit all changes and push to Github

   ​

