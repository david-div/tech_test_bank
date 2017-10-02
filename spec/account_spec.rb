require 'account'

RSpec.describe 'Account' do
  it 'should create a new account' do
    expect(Account).to respond_to :new
  end

  it 'should allow you to credit an initial deposit' do
    account = Account.new(1000)
    expect(account.deposit).to eq(1000)
  end

end
