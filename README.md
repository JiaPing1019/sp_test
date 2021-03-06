# sp_test

## Introduction

This is a tech test for [Smart pension](https://www.smartpension.co.uk/), writing a script that can receive a log as argument in Ruby. Apart from Ruby, the only technology used is the [RSpec](http://rspec.info/) to test our code work properly.

## Quickstart

- Clone/download the repository

- Move to ruby_app directory
```
 cd ruby_app
```

- Install the dependencies specified in the Gemfile
```
bundle install
```

- Run the ruby script to check the result of the most page views, and most unique page views lists
```
bundle exec ruby script/log_report_script.rb webserver.log
```

- Run the tests in RSpec
```
bundle exec rspec   ## runs the entire test suite
```

- Check the test result without running any command
```
Take a look at spec/examples.txt
```

## Test coverage
After running `bundle exec rspec`, open coverage/index.html in the browser by executing the below command

#### Mac
```
open coverage/index.html
```

#### debian/ubuntu Terminal
```
xdg-open coverage/index.html
```

You will see the result as the screenshot

<img width="1392" alt="Screen Shot 2022-03-15 at 23 38 09" src="https://user-images.githubusercontent.com/12680148/158489578-21d3e4ff-f0c4-42b2-b603-05a469fa1a57.png">


-----------
Thank you for taking time to review my code. If you have any suggestions or feedback, I would definitely like to hear from you. Cheers. 
