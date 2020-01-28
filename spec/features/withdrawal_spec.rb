require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it 'should show a withdrawal on the statement' do
    bank.deposit(1000, Date.parse("10/01/2012"))
    bank.withdraw(500, Date.parse("12/01/2012"))
    message = ["date || credit || debit || balance",
    "12/01/2012 || || 500.00 || 500.00",
    "10/01/2012 || 1000.00 || || 1000.00"].join("\n")

    expect { bank.print_statement }.to output("#{message}").to_stdout
  end

end
