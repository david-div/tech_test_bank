# require './lib/account.rb'
require_relative 'statement'

class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :deposit, :statement_history, :balance

  def initialize(deposit = DEPOSIT_AMOUNT, _print)
    @deposit = deposit
    @statement_history = []
    @balance = 0
    initial_deposit
  end

  def add_funds(amount)
    @balance += amount
    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), credit: amount, debit: 0, balance: balance }
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), credit: 0, debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print(@statement_history)
  end

  private

  def initial_deposit
    @balance += deposit
    @statement_history << { date: Time.now.strftime('%d/%m/%Y'), credit: deposit, debit: 0, balance: balance }
  end
end

# add an initial depost method, with self.deposit on init
