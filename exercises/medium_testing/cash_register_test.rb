require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
    @transaction.amount_paid = 50
    
    @t_shirt = Transaction.new(15)
    @t_shirt.amount_paid = 20
  end
  
  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money
    assert_equal(previous_amount + 50, current_amount)
  end
  
  def test_change
    assert_equal(5, @register.change(@t_shirt))
  end
  
  def test_give_receipt
    assert_output("You've paid $15.\n") { @register.give_receipt(@t_shirt) }
  end
end