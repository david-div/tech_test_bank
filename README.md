## Makers Bank tech test

Practice tech test, simulating simple banking transactions:
  - Deposits, withdrawals.
  - Account statement (date, amount, balance) printing.
  - Data kept in memory

To be run in irb

## Getting started

`git clone git@github.com:david-div/tech_test_bank.git`  
`bundle`

## Usage

`run in irb`  
`require './lib/account.rb'`

`account = Account.new`  

The following options are then available:
 - add_funds(amount)
 - withdraw_funds(amount)
 - print_statement
 

 All amounts are positive


## Running tests

`rspec`
