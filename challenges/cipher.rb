class Cipher
  SWITCH = {
    "a" => "z", "b" => "y", "c" => "x", "d" => "w", "e" => "v", "f" => "u",
    "g" => "t", "h" => "s", "i" => "r", "j" => "q", "k" => "p", "l" => "o",
    "m" => "n", "n" => "m", "o" => "l", "p" => "k", "q" => "j", "r" => "i",
    "s" => "h", "t" => "g", "u" => "f", "v" => "e", "w" => "d", "x" => "c",
    "y" => "b", "z" => "a"
  }

  def self.encode(string)
    alphanumerics = remove_non_alphanumerics(string)
    encrypted_string = encrypt(alphanumerics)
    delimit_string(5, encrypted_string)
  end

  class << self
    private

    def remove_non_alphanumerics(string)
      string.downcase.gsub(/[^a-z0-9]/, '')
    end

    def encrypt(unencrypted_string)
      encrypted_string = ''

      unencrypted_string.each_char do |char|
        encrypted_string << (SWITCH[char] || char)
      end

      encrypted_string
    end

    def delimit_string(group_size, string)
      index = 0
      delimited_string = ''

      loop do
        delimited_string << string[index]
        index += 1
        break if index >= string.size
        delimited_string << " " if index % group_size == 0
      end

      delimited_string
    end
  end
end
