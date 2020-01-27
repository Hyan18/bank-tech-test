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

end
