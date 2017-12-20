require_relative 'statement'
require_relative 'transaction'

# lib/account
class Account

  attr_reader :statement_history, :balance, :date

  def initialize(transaction = Transaction.new)
    @statement_history = []
    @balance = 0
    @transaction = transaction
  end

  def add_funds(amount)
    @balance += amount
    @statement_history.unshift(@transaction.add_funds(amount, balance))
  end

  def withdraw_funds(amount)
    @balance -= amount
    @statement_history.unshift(@transaction.withdraw_funds(amount, balance))
  end

  def print_statement(statement = Statement.new)
    statement.print(@statement_history)
  end

end
