require 'account'

RSpec.describe 'Account' do
  subject(:account) { Account.new(1000) }

  context '#initialize' do
    it 'should create a new account' do
      expect(Account).to respond_to :new
    end
    it 'should allow you to credit an initial deposit' do
      expect(account.deposit).to eq(1000)
    end
  end

  context '#balance' do
    it 'should show the statement amount' do
      expect(account.balance).to eq(1000)
    end
  end

  context '#add_funds' do
    it 'should add to the total when credited' do
      account.add_funds(2000)
      expect(account.balance).to eq(3000)
    end
  end

  context '#withdraw_funds' do
    it 'should deduct from the total when debited' do
      account.withdraw_funds(500)
      expect(account.balance).to eq(500)
    end
  end

  context '#print_statement' do
    it 'should show the credited amount and balance' do
      account.add_funds(2000)
      expect(account.print_statement).to include({credit: 2000, balance: 3000})
    end
  end
end
