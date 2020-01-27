require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  describe '#deposit' do
    it 'should deposit an amount into the bank' do
      expect(bank.deposit(100)).to eq("Successfully deposited £100")
    end
  end

end
