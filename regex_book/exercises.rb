# 1.
def url?(string)
  string.match(/\Ahttps?:\/\/\S*\z/) ? true:false # or prefix with double bang (!!) (there is also a match? method)
end

url?('http://launchschool.com')   # -> true
url?('https://example.com')       # -> true
url?('https://example.com hello') # -> false
url?('   https://example.com')    # -> false

# 2.
def fields(string)
  string.split(/[ \t,]+/)
end

fields("Pete,201,Student") # -> ["Pete", "201", "Student"]
fields("Pete \t 201    ,  TA") # -> ["Pete", "201", "TA"]
fields("Pete \t 201") # -> ["Pete", "201"]
fields("Pete \n 201") # -> ["Pete", "\n", "201"]

# 3.
def mystery_math(equation)
  equation.sub(/[+\-*\/]/, '?')
end

mystery_math('4 + 3 - 5 = 2') # -> '4 ? 3 - 5 = 2'
mystery_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 + 2) / 7 - 1 = 1'

# 4.
def mysterious_math(equation)
  equation.gsub(/[+\-*\/]/, '?')
end

mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

# 5.
def danish(string)
  string.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

danish('An apple a day keeps the doctor away') # -> 'An danish a day keeps the doctor away'
danish('My favorite is blueberry pie') # -> 'My favorite is danish pie'
danish('The cherry of my eye') # -> 'The danish of my eye'
danish('apple. cherry. blueberry.') # -> 'danish. cherry. blueberry.'
danish('I love pineapple') # -> 'I love pineapple'

# 6.
def format_date(string)
  string.gsub(/(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1') # could add string anchors
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2016/06/17') # -> '2016/06/17' (no change)

# 7.
def format_date(string)
  regex = /\A(?<year>\d{4})(?<del>[-\/])(?<month>\d{2})\k<del>(?<day>\d{2})\z/
  string.gsub(regex, '\k<day>.\k<month>.\k<year>') # using named capture groups
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'
format_date('2015/01-31') # -> '2015/01-31' (no change)