require_relative 'bank_log'

class Bank
  def initialize(bank_log = BankLog.new)
    @balance = 0
    @bank_log = bank_log
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount

    @bank_log.add(type: "deposit", amount: amount, balance: @balance, date: date)
    "Successfully deposited £#{amount}"
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise BankError.new("Insufficient balance") if @balance < amount

    @balance -= amount

    @bank_log.add(type: "withdrawal", amount: amount, balance: @balance, date: date)
    "Successfully withdrawn £#{amount}"
  end

end

# BankError class for easier debugging
class BankError < StandardError
end
