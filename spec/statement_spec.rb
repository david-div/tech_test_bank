require 'statement'

RSpec.describe 'Statement' do

  subject(:statement) { Statement.new }

  context '#print_statement' do
    it 'should print and format the statement' do

      transactions = [
        {
          date: Time.now.strftime('%d/%m/%Y'),
          credit: 1000,
          debit: 0,
          balance: 1000
        },
        {
          date: Time.now.strftime('%d/%m/%Y'),
          credit: 0,
          debit: 500,
          balance: 500
        }
      ]
      time = Time.now.strftime('%d/%m/%Y')
      string = "#{time} || 1000 ||  || 1000\n#{time} || 0 || 500 || 500\n"
      expect { statement.print_statement(transactions) }.to output(string).to_stdout
    end
  end

end
