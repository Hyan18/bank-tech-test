require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  it 'should show a deposit on the statement' do
    bank.deposit(1000, "10/01/2012")
    expect(bank.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
  end

end