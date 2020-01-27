require_relative 'bank_log'

class Bank
  def initialize(bank_log = BankLog.new)
    @balance = 0
    @bank_log = bank_log
  end

  def deposit(amount)
    @balance += amount

    @bank_log.add
    "Successfully deposited £#{amount}"
  end

  def withdraw(amount)
    raise BankError.new("Insufficient balance") if @balance < amount

    @balance -= amount

    "Successfully withdrawn £#{amount}"
  end

end

# BankError class for easier debugging
class BankError < StandardError
end
