require 'bank'

describe Bank do
  let(:bank_log) { double :bank_log, add: nil }
  let(:statement) { double :statement, print: nil }
  let(:statement_class) { double :statement_class, new: statement }

  subject(:bank) { described_class.new(bank_log) }

  describe '#deposit' do
    it 'should deposit £100 into the bank' do
      expect(bank.deposit(100)).to eq("Successfully deposited £100.00")
    end

    it 'should deposit £200 into the bank' do
      expect(bank.deposit(200)).to eq("Successfully deposited £200.00")
    end

    it 'should deposit £10.50 into the bank' do
      expect(bank.deposit(10.50)).to eq("Successfully deposited £10.50")
    end

    it 'should create an entry in the bank log' do
      expect(bank_log).to receive(:add).with(
        type: :deposit,
        amount: 100,
        balance: 100,
        date: Date.parse("10/01/2012")
      )
      bank.deposit(100, Date.parse("10/01/2012"))
    end
  end

  describe '#withdraw' do

    context 'with sufficient balance' do
      before(:each) do
        bank.deposit(2000)
      end

      it 'should withdraw £100' do
        expect(bank.withdraw(100)).to eq("Successfully withdrawn £100.00")
      end

      it 'should withdraw £200' do
        expect(bank.withdraw(200)).to eq("Successfully withdrawn £200.00")
      end

      it 'should withdraw £10.50' do
        expect(bank.withdraw(10.50)).to eq("Successfully withdrawn £10.50")
      end

      it 'should create an entry in the bank log' do
        expect(bank_log).to receive(:add).with(
          type: :withdrawal,
          amount: 1000,
          balance: 1000,
          date: Date.parse("10/01/2012")
        )
        bank.withdraw(1000, Date.parse("10/01/2012"))
      end

    end

    it 'should deduct from the balance' do
      bank.deposit(100)
      bank.withdraw(100)
      expect { bank.withdraw(100) }.to raise_error("Insufficient balance")
    end

    it 'should raise an error when withdrawing £100 from a bank with minimum balance' do
      expect { bank.withdraw(100) }.to raise_error("Insufficient balance")
    end

  end

  describe '#print_statement' do
  
    it 'should create an instance of statement' do
      expect(statement_class).to receive(:new).with(bank_log)

      bank.print_statement(statement_class)
    end

  end

end
