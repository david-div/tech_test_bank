require 'account'

RSpec.describe Account do

    subject(:account) { described_class.new }


    before(:each) do
      account.add_funds(1000)
    end

    let(:time) { Time.now.strftime('%d/%m/%Y') }


  context '#initialize' do
    it 'should create a new account' do
      expect(Account).to respond_to :new
    end

  end

  context '#balance' do
    it 'should show the statement amount' do
      # account.add_funds(1000)
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

  context '#statement_history' do
    it 'should add to the statement' do
      account.add_funds(2000)
      hash = hash_including(credit: 2000, balance: 3000)
      expect(account.statement_history).to include(hash)
    end

    it 'should add the time on each transaction' do
      account.withdraw_funds(500)
      hash = hash_including(date: time, debit: 500, balance: 500)
      expect(account.statement_history).to include(hash)
    end

    it 'should add all transactions to statement_history' do
      account.add_funds(2000)
      account.withdraw_funds(500)
      account.add_funds(3000)
      s_histry = [
        { date: time, credit: 3000, balance: 5500 },
        { date: time, debit: 500, balance: 2500 },
        { date: time, credit: 2000, balance: 3000 },
        { date: time, credit: 1000, balance: 1000 }
      ]
      expect(account.statement_history).to eq(s_histry)
    end
  end

  context '#print_statement' do
    it 'should respond to print' do
      statement = double(:statement)
      expect(statement).to receive(:print)
      account.print_statement(statement)
    end
  end
end
