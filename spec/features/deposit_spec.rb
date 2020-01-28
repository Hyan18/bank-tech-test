require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it 'should show a deposit on the statement' do
    bank.deposit(1000, Date.parse("10/01/2012"))
    message = ["date || credit || debit || balance", 
    "10/01/2012 || 1000.00 || || 1000.00"].join("\n")

    expect { bank.print_statement }.to output("#{message}").to_stdout
  end

end
