require 'statement'

describe Statement do
  let(:transaction_1) { 
    double :transaction, date: "10/01/2012", credit: 1000, debit: nil, balance: 1000
  }
  let(:transaction_2) {
    double :transaction, date: "13/01/2012", credit: 2000, debit: nil, balance: 3000
  }
  let(:transaction_3) {
    double :transaction, date: "14/01/2012", credit: nil, debit: 500, balance: 2500
  }
  let(:bank_log) { double :bank_log, history: [transaction_1, transaction_2, transaction_3] }
  
  subject(:statement) { described_class.new(bank_log) }

  describe '#print' do
    it 'should return a formatted statement' do
      message = ["date || credit || debit || balance",
      "14/01/2012 || || 500.00 || 2500.00",
      "13/01/2012 || 2000.00 || || 3000.00",
      "10/01/2012 || 1000.00 || || 1000.00"].join("\n")

      expect(statement.print).to eq(message)
    end
  end

end
