require_relative 'statement'
require_relative 'transactions'

# lib/account
class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :statement_history, :balance, :date

  def initialize(deposit = DEPOSIT_AMOUNT)
    @statement_history = []
    @balance = deposit
    @statement_history.unshift(credit_hash(deposit))
  end

  def add_funds(amount)
    @balance += amount
    @statement_history << credit_hash(amount)
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement_history << { date: date, debit: amount, balance: balance }
  end

  def print_statement(statement = Statement.new)
    statement.print(@statement_history)
  end

  private

  def credit_hash(amount)
    { date: date, credit: amount, balance: balance }
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

end




# account currently has 3 responsibilities:
  # balance
  # transaction history
  # print_statement (which )
# 
