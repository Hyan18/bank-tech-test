class Bank
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
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
