require_relative 'transaction'

class BankLog
  attr_reader :history

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @history = []
  end

  def add(type:, amount:, balance:, date:)
    credit_amount, debit_amount = amounts(type, amount)

    @history.unshift(@transaction_class.new(
      date: date,
      credit: credit_amount,
      debit: debit_amount,
      balance: balance
    ))
  end

  private

  def amounts(type, amount)
    type == :deposit ? [amount, nil] : [nil, amount]
  end

end
