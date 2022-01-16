# _Role Playing Game_

#### _Ruby week 4 practice project for Rails with Active Record lesson at Epicodus Bootcamp_

#### Created By: **Christopher Neal & Frank Proulx**

## Technologies Used

* _Ruby_
* _Gems_
* _Bundler_
* _RSpec_
* _shoulda-matchers_
* _IRB_
* _Pry_
* _Capybara_
* _Postgres_
* _SQL_
* _SQL Designer_
* _Rails_
* _ActiveRecord_
* _Bootstrap SCSS_
* _Faker_
* _Devise_
* _Kaminari_

## Description

_This project was created for Epicodus bootcamp to show proficiency in Rails with Active Record. The application is for a specialty foods company to organize products and reviews._ 
_All users can create an account, log in, browse products, and add reviews._
_Additionally, admins have full CRUD functionality for products and reviews._

## Database Schema

![image_of_database_schema](./public/role_playing_game_db_schema.png)

## System Requirements

* Ruby v2.6.5 recommended
* Postgres 12.9  
_(Note: Ruby gem dependencies will be installed automatically by Bundler.)_

## Setup/Installation Requirements

* Clone the GitHub repository: [https://github.com/christophermneal/role_playing_game](https://github.com/christophermneal/role_playing_game)
* From the main project directory, enter `bundle install` in the terminal to populate gems.
* To create a database, type in your terminal: 
      `rake db:setup`
* Enter `rspec` into the terminal to confirm passing of all tests.
* Run `rails s` to start the Rails server.
* Open browswer and enter the url http://localhost:3000/ unless otherwise prompted in the terminal.
* From the home page, click 'Sign in' from the navbar.
* To login as an admin user, fill in the Email form with 'admin@fake.com'
* To login as a non-admin user, fill in the Email form with 'user@fake.com'
* The password for either is 'testing'

## Known Bugs

* _None at this time._

## License

_[MIT](https://opensource.org/licenses/MIT)_
Copyright (c) _2022_ _Christopher Neal & Frank Proulx_

## Support and Contact Details
* _[christopher.m.neal@gmail.com](mailto:christopher.m.neal@gmail.com)_