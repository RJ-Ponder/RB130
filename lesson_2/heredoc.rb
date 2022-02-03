# Playing with heredoc

result_1 = <<HEREDOC # This could be any word you choose; uppercase by convention
This would contain specially formatted text.

That might span many lines
HEREDOC

p result_1

result_2 = <<-INDENTED_HEREDOC # Without "-" preceding, it wouldn't allow the indenting. Useful in methods because they are indented by def and end.
This would contain specially formatted text.

That might span many lines
  INDENTED_HEREDOC
  
p result_2

result_3 = <<~SQUIGGLY_HEREDOC # The "~" allows you to have indented content too without it showing up in the output.
  This would contain specially formatted text.

  That might span many lines
SQUIGGLY_HEREDOC

p result_3

expected_result = <<-EXPECTED.chomp # You can call methods on it. Here it gets rid of the ending newline
One plus one is #{1 + 1}
EXPECTED

p expected_result

# As you saw from above, can interpolate or escape characters. Use single quotes to prevent this:
expected_result = <<-'EXPECTED'
One plus one is #{1 + 1}
EXPECTED