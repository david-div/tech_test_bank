# require './lib/account.rb'

class Account
  attr_reader :deposit

  def initialize(deposit)
    @deposit = deposit
    @total = deposit
  end

  def statement_amount
    @total
  end

  def add_funds(amount)
    @total += amount
  end

end
