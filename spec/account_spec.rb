require 'account'

RSpec.describe 'Account' do

subject(:account) { Account.new(1000) }

  it 'should create a new account' do
    expect(Account).to respond_to :new
  end

  it 'should allow you to credit an initial deposit' do
    expect(account.deposit).to eq(1000)
  end

  it 'should show the statement amount' do
    expect(account.statement_amount).to eq(1000)
  end

  it 'should add to the total when credited' do
    account.add_funds(2000)
    expect(account.statement_amount).to eq(3000)
  end

  it 'should deduct from the total when debited' do
    account.withdraw_funds(500)
    expect(account.statement_amount).to eq(500)
  end

end
