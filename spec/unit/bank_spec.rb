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
      expect(bank_log).to receive(:add)
      bank.deposit(100)
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

  end

end
