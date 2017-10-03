# require './lib/account.rb'
require_relative 'statement'

class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :deposit, :statement

  def initialize(deposit = DEPOSIT_AMOUNT)
    @deposit = deposit
    @total = deposit
    @statement = []
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: deposit, debit: 0, balance: balance  }
  end

  def balance
    @total
  end

  def add_funds(amount)
    @total += amount
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: amount, debit: 0, balance: balance }
  end

  def withdraw_funds(amount)
    @total -= amount
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: 0, debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print_statement(@statement)
  end
end
