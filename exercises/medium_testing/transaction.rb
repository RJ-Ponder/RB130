class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input: $stdin, output: $stdout)
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

# Helpful article for understanding StringIO and stdin/stdout
# https://thoughtbot.com/blog/io-in-ruby

# IO objects wrap Input/Output streams.
# The standard input stream is the keyboard, STDIN and $stdin
# The standard output stream is the terminal, STDOUT and $stdout
# The global variable references the constant but can be reassigned if needed

# You can write an IO object with gets: input.gets
# You can read an IO object with puts: output.puts

# StringIO allows strings to behave like IOs
# Rather than capturing input from the keyboard, you can capture input from a default StringIO object.
# Rather than consuming output to the terminal, you can consume output to a StringIO object.
