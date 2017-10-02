# require './lib/account.rb'

class Account
  DEPOSIT_AMOUNT = 1000

  attr_reader :deposit

  def initialize(deposit = DEPOSIT_AMOUNT)
    @deposit = deposit
    @total = deposit
    @statement = []
  end

  def balance
    @total
  end

  def add_funds(amount)
    @total += amount
    @statement << { time: Time.now.strftime("%d/%m/%Y"), credit: amount, debit: 0, balance: balance }
  end

  def withdraw_funds(amount)
    @total -= amount
    @statement << { time: Time.now.strftime("%d/%m/%Y"), credit: 0, debit: amount, balance: balance }
  end

  def print_statement
    @statement.each do |trans|
      puts trans
    end
  end

end
