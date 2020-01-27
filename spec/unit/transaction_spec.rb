require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'should have a date, credit, debit and balance' do
      transaction = Transaction.new(date: "10/01/2012", credit: 1000, debit: 0, balance: 1000)
      expect(transaction).to have_attributes(
        date: "10/01/2012",
        credit: 1000,
        debit: 0,
        balance: 1000
      )
    end
  end
end
