class Octal
  def initialize(octal)
    @octal = octal
  end

  def valid_octal?
    !@octal.match?(/[^0-7]+/)
  end

  def to_decimal
    return 0 unless valid_octal?

    digits = @octal.chars.reverse
    digits.map.with_index { |digit, index| digit.to_i * (8**index) }.sum
  end
end
