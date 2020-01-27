class Statement
  def initialize(bank_log)
    @bank_log = bank_log
  end

  def print
    header + "\n" + formatted_transactions
  end

  private

  def format_amount(amount)
    return ' ' + '%.2f' % amount if amount
  end

  def formatted_transactions
    arr = @bank_log.history.reverse.map { |t| [t.date, format_amount(t.credit), format_amount(t.debit), format_amount(t.balance)].join(" ||") }
    arr.join("\n")
  end

  def header
    ["date", "credit", "debit", "balance"].join(" || ")
  end
end
