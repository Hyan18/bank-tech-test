require_relative 'bank_log'
require_relative 'statement'

class Bank
  def initialize(bank_log = BankLog.new)
    @balance = 0
    @bank_log = bank_log
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount

    @bank_log.add(type: :deposit, amount: amount, balance: @balance, date: date)
    "Successfully deposited £#{'%.2f' % amount}"
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise BankError.new("Insufficient balance") if @balance < amount

    @balance -= amount

    @bank_log.add(type: :withdrawal, amount: amount, balance: @balance, date: date)
    "Successfully withdrawn £#{'%.2f' % amount}"
  end

  def print_statement(statement_class = Statement)
    statement_class.new(@bank_log).print
  end

end

# BankError class for easier debugging
class BankError < StandardError
end
