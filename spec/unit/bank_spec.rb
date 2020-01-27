require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  describe '#deposit' do
    it 'should deposit £100 into the bank' do
      expect(bank.deposit(100)).to eq("Successfully deposited £100")
    end

    it 'should deposit £200 into the bank' do
      expect(bank.deposit(200)).to eq("Successfully deposited £200")
    end
  end

  describe '#withdraw' do
    it 'should throw an error when withdrawing from a bank with 0 balance' do
      expect { bank.withdraw(100) }.to raise_error("Insufficient balance")
    end

    it 'should withdraw £100' do
      bank.deposit(100)
      expect(bank.withdraw(100)).to eq("Successfully withdrawn £100")
    end

    it 'should withdraw £200' do
      bank.deposit(500)
      expect(bank.withdraw(200)).to eq("Successfully withdrawn £200")
    end
  end

end
