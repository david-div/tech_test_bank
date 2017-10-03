# require './lib/account.rb'
require_relative 'statement'

# lib/account
class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :statement_history, :balance, :date

  def initialize(deposit = DEPOSIT_AMOUNT)
    @deposit = deposit
    @statement_history = []
    @balance = 0
    @date = Time.now.strftime('%d/%m/%Y')
    initial_deposit(deposit)
  end

  def add_funds(amount)
    @balance += amount
    @statement_history << { date: date, credit: amount, balance: balance }
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement_history << { date: date, debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print(@statement_history)
  end

  private

  def initial_deposit(amount)
    @balance += amount
    @statement_history << { date: date, credit: amount, balance: balance }
  end
end
