class Transaction

  def add_funds(amount, balance)
    { date: date, credit: amount, balance: balance }
  end

  def withdraw_funds
    { date: date, debit: amount, balance: balance }
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end



end
