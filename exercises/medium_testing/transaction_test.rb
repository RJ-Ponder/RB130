require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  # verify that transaction prompt_for_payment sets the amount_paid correctly
  def test_prompt_for_payment
    transaction = Transaction.new(10)
    input = StringIO.new("10\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(10, transaction.amount_paid)
  end
end

# You could also use assert_output to ignore or silence io streams you don't need