require 'statement'

RSpec.describe Statement do
  subject(:statement) { described_class.new }

  before(:all) do
    time = Time.now.strftime('%d/%m/%Y')
    @transactions = [
      {
        date: time,
        credit: 1000,
        debit: 0,
        balance: 1000
      },
      {
        date: time,
        credit: 0,
        debit: 500,
        balance: 500
      }
    ]
    @string = "#{time} || 1000 || 0 || 1000\n"\
              "#{time} || 0 || 500 || 500\n"
  end

  context '#format_statement' do
    it 'should print and format the statement' do

      expect { statement.format_statement(@transactions) }.to output(@string).to_stdout
    end
  end

  context '#header' do
    it 'should print out a header' do
      string = "date || credit || debit || balance\n"
      expect { statement.header }.to output(string).to_stdout
    end
  end

  context '#print_statement' do
    it 'should print the header and statement' do
      header_string = "date || credit || debit || balance\n"
      expect { statement.print(@transactions) }.to output(header_string + @string).to_stdout
    end
  end
end
