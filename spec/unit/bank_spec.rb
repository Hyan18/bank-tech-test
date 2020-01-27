require 'bank'

describe Bank do
  let(:bank_log) { double :bank_log, add: nil }

  subject(:bank) { described_class.new(bank_log) }

  describe '#deposit' do
    it 'should deposit £100 into the bank' do
      expect(bank.deposit(100)).to eq("Successfully deposited £100")
    end

    it 'should deposit £200 into the bank' do
      expect(bank.deposit(200)).to eq("Successfully deposited £200")
    end

    it 'should create an entry in the bank log' do
      expect(bank_log).to receive(:add).with(
        type: :deposit,
        amount: 100,
        balance: 100,
        date: "10/01/2012"
      )
      bank.deposit(100, "10/01/2012")
    end
  end

  describe '#withdraw' do

    it 'should withdraw £100' do
      bank.deposit(100)
      expect(bank.withdraw(100)).to eq("Successfully withdrawn £100")
    end

    it 'should withdraw £200' do
      bank.deposit(500)
      expect(bank.withdraw(200)).to eq("Successfully withdrawn £200")
    end

    it 'should deduct from the balance' do
      bank.deposit(100)
      bank.withdraw(100)
      expect { bank.withdraw(100) }.to raise_error("Insufficient balance")
    end

    it 'should raise an error when withdrawing £100 from a bank with 0 balance' do
      expect { bank.withdraw(100) }.to raise_error("Insufficient balance")
    end

    it 'should create an entry in the bank log' do
      bank.deposit(2000)
      expect(bank_log).to receive(:add).with(
        type: :withdrawal,
        amount: 1000,
        balance: 1000,
        date: "10/01/2012"
      )
      bank.withdraw(1000, "10/01/2012")
    end

  end

end
