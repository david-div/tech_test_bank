require 'account'

RSpec.describe 'Account' do
  it 'should creat a new account' do
    expect(Account).to respond_to :new
  end
end
