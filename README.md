# Store App

[![Code Climate](https://codeclimate.com/github/jvnill/store/badges/gpa.svg)](https://codeclimate.com/github/jvnill/store)
[![Test Coverage](https://codeclimate.com/github/jvnill/store/badges/coverage.svg)](https://codeclimate.com/github/jvnill/store)
[![Build Status](https://travis-ci.org/jvnill/store.svg?branch=master)](https://travis-ci.org/jvnill/store)

To be used in conjunction with the [Bank App](https://github.com/jvnill/bank)

## Setup

1. Run the bank app and create a connected app.
2. Download the certificate of the connected app and save it to Rails.root/certs/bank_key.pem
3. Take note of the connected app id and set it to the BANK_CONNECTED_APP_ID constant
4. Run rake db:seed to create an admin (admin@store.com/password)

## Update Constants

Change the following constants in `config/initializers/constants.rb`

GATEWAY_PAYMENT_URL = change the host to point to the url of the bank app
GATEWAY_VERIFY_URL = change the host to point to the url of the bank app
BANK_CONNECTED_APP_ID = change to the id of the created connected_app of the bank app
