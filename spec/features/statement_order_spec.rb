require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it 'statement should show transactions in reverse chronological order' do
    bank.deposit(1000, "10/01/2012")
    bank.deposit(2000, "13/01/2012")
    bank.withdraw(500, "14/01/2012")
    message = ["date || credit || debit || balance",
    "14/01/2012 || || 500.00 || 2500.00",
    "13/01/2012 || 2000.00 || || 3000.00",
    "10/01/2012 || 1000.00 || || 1000.00"].join("\n")

    expect { bank.print_statement }.to output("#{message}").to_stdout
 
  end

end
