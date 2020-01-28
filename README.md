# Bank tech test

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

# What it does

The program runs in IRB and imitates features from a bank.
You can make deposit and withdrawals and also print a bank statement containing all your transactions.

# Installation

```
git clone git@github.com:Hyan18/bank-tech-test.git
cd bank-tech-test
bundle install
```

```
rspec # To run tests
rubocop # To run linter
```

# Program in action

```
2.6.5 :001 > bank = Bank.new
 => #<Bank:0x00007fb6e7990fc0 @balance=0, @bank_log=#<BankLog:0x00007fb6e7990f98 @transaction_class=Transaction, @hist
ory=[]>> 
2.6.5 :002 > bank.withdraw(1000)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required
)>'
        2: from (irb):2
        1: from /Users/student/Projects/Individual-challenges/bank-tech-test/lib/bank.rb:20:in `withdraw'
BankError (Insufficient balance)
2.6.5 :003 > bank.deposit(1000)
 => "Successfully deposited £1000.00" 
2.6.5 :004 > bank.deposit(100.50)
 => "Successfully deposited £100.50" 
2.6.5 :005 > bank.withdraw(500)
 => "Successfully withdrawn £500.00" 
2.6.5 :006 > bank.withdraw(10.25)
 => "Successfully withdrawn £10.25" 
2.6.5 :007 > bank.deposit(200)
 => "Successfully deposited £200.00" 
2.6.5 :008 > bank.print_statement
date || credit || debit || balance
28/01/2020 || 200.00 || || 790.25
28/01/2020 || || 10.25 || 590.25
28/01/2020 || || 500.00 || 600.50
28/01/2020 || 100.50 || || 1100.50
28/01/2020 || 1000.00 || || 1000.00
```

# User Stories

```
As a client
So I can save money
I would like to be able to deposit money into my account
```

```
As a client
So I can spend money
I would like to able to withdraw money from my account
```

```
As a client
So I can keep track of my banking habits
I would like to able to see my account statement
```

# Approach

Features needed are: deposit, withdraw, print (bank statement)
So my initial thoughts were that I would want a Bank class which deals with the balance (deposit and withdrawal), which interacts with a BankLog class that archives all transactions which would then be passed through to a Statement class that deals with formatting the bank statement.

As I progressed I also ended up making a Transaction class which holds the information of each transaction as attributes - there was nothing else in the class so perhaps I could have just used hashes? Although I do think putting it into a class makes the code more extendable.

## Structure

I structured my code with classes that start with initializers followed by public methods and finally private methods.
