# require './lib/account.rb'

class Account
  attr_reader :deposit

  def initialize(deposit)
    @deposit = deposit
  end

  def statement_amount
    @total = deposit
    @total
  end

end
