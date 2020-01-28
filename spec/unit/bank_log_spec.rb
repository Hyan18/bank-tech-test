require 'bank_log'

describe BankLog do
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  
  subject(:bank_log) { described_class.new(transaction_class) }

  describe '#add' do
    it 'should create a deposit transaction and store it' do
      expect(transaction_class).to receive(:new).with(
        date: Date.parse("10/01/2012"),
        credit: 100,
        debit: nil,
        balance: 100
      )

      expect(bank_log.history).to receive(:unshift).with(transaction)

      bank_log.add(
        type: :deposit,
        amount: 100,
        balance: 100,
        date: Date.parse("10/01/2012")
      )
    end

    it 'should create a withdrawal transaction and store it' do
      expect(transaction_class).to receive(:new).with(
        date: Date.parse("10/01/2012"),
        credit: nil,
        debit: 1000,
        balance: 1000
      )

      expect(bank_log.history).to receive(:unshift).with(transaction)

      bank_log.add(
        type: :withdrawal,
        amount: 1000,
        balance: 1000,
        date: Date.parse("10/01/2012")
      )
    end
  end

end
