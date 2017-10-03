# require './lib/account.rb'
require_relative 'statement'

class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :deposit, :statement_history, :balance

  def initialize(deposit = DEPOSIT_AMOUNT)
    @deposit = deposit
    @statement_history = []
    @balance = 0
    initial_deposit
  end

  def add_funds(amount)
    @balance += amount

    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), credit: amount, balance: balance }
  end

  def withdraw_funds(amount)
    @balance -= amount

    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print(@statement_history)
  end

  private

  def initial_deposit
    @balance += deposit
    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), credit: deposit, balance: balance }
  end
end

account = Account.new
account.print_statement
account.add_funds(2000)
account.print_statement
