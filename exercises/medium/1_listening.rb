class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
  
  def listen
    record(yield) if block_given?
  end
  
  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# Further Exploration posted in the user submitted solutions
# The book presents two options for listen method:

def listen
    return unless block_given?
    recording = yield
    record(recording)
end

def listen
  recording = yield if block_given?
  record(recording) if recording
end

# These two methods are similar, but handle the empty block edge case differently
# In the first, an empty block will still be "listened to" and nil will be recorded.
# In the second case, there is another guard clause that prevents empty blocks from being recorded.

# This will affect the play method because either you will play nil as the last recording
# or you will actually play the last recorded message

# My solution of
def listen
  recording(yield) if block_given?
end

# behaves the same as the first book solution, where empty blocks are still treated as recordings.

# Finally, the last sentence in the solution should be reworded:
# Original: If nothing has been recorded, then we output nothing. And if there was something recorded, then that string will be the output from this Device#play method.
# New: If nothing has been recorded, then we output the last recorded message. And if there was something recorded, even if that something is nil, the return value of the block will be the output from this Device#play method.