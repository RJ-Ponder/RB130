# the splat operator turns one or more arguments into an array to then be used
# raven, finch, *raptors = %w(raven finch hawk, eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']



def group(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
group(birds) { |_, _, *raptors| puts "#{raptors}" }
