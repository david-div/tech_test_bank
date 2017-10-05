# lib/account
class Statement

  def print(statement)
    header
    format_statement(statement)
  end

  def header
    puts "date || credit || debit || balance"
  end

  def format_statement(statement)
    statement.each do |trans|
      puts "#{trans[:date]} || #{trans[:credit]} || #{trans[:debit]} || #{trans[:balance]}"
    end
  end

end
