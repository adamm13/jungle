# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

* Users can Register and Sign in and out
* Users can sort products by category
* Users can add and remove items from their carts.
* Users can complete full checkout using [Stripe](https://stripe.com/en-ca)
* Administrators have password protected access to dashboards
* Administrators can add/remove products and categories

## Website

* Signup
![alt text](https://github.com/adamm13/jungle/blob/master/docs/signup.png)

* Category
![alt text](https://github.com/adamm13/jungle/blob/master/docs/category.png)

* Product
![alt text](https://github.com/adamm13/jungle/blob/master/docs/product.png)

* Checkout
![alt text](https://github.com/adamm13/jungle/blob/master/docs/checkout.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
