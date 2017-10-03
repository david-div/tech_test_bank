
class Statement

  def header
    puts "date || credit || debit || balance"
  end

  def print_statement(statement)
    statement.each do |trans|
      puts "#{trans[:date]} || #{trans[:credit]} || #{trans[:debit]} || #{trans[:balance]}"
    end
  end

end
