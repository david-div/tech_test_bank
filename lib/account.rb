# require './lib/account.rb'
require_relative 'statement'

class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :deposit, :statement, :balance

  def initialize(deposit = DEPOSIT_AMOUNT)
    @deposit = deposit
    @statement = []
    @balance = 0
    initial_deposit
  end

  # def balance
  #   @total
  # end

  def add_funds(amount)
    @balance += amount
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: amount, debit: 0, balance: balance }
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: 0, debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print_statement(@statement)
  end

  private

  def initial_deposit
    @balance += deposit
    @statement << { date: Time.now.strftime('%d/%m/%Y'), credit: deposit, debit: 0, balance: balance }
  end

end

# add an initial depost method, with self.deposit on init
