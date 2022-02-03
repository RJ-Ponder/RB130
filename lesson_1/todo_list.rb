class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    todos.all? { |item| item.done? }
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.class == Todo
    
    todos.push(todo)
  end
  alias_method :<<, :add

  def item_at(index)
    todos.fetch(index)
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def done!
    todos.each { |item| item.done! }
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end
  
  def to_a
    todos.clone
  end
  
  def each
    todos.each do |item|
      yield(item)
    end
    self
  end
  
  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end
  
  def find_by_title(search_string)
    # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
    each do |todo|
      return todo if todo.title == search_string
    end
    nil
  end
  
  def all_done
    # returns new TodoList object containing only the done items
    select do |todo|
      todo.done?
    end
  end
  
  def all_not_done
    # returns new TodoList object containing only the not done items
    select do |todo|
      !todo.done?
    end
  end
  
  def mark_done(string)
    # takes a string as argument, and marks the first Todo object that matches the argument as done.
    each do |todo|
      return todo.done! if todo.title == string || todo.description == string
    end
    nil
  end
  
  def mark_all_done
    # mark every todo as done
    each do |todo|
      todo.done!
    end
  end
  
  def mark_all_undone
    # mark every todo as not done
    each do |todo|
      todo.undone!
    end
  end
  
  private
  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect

# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# # list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# p list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# #to_a
# p list.to_a                      # returns an array of all items in the list

# #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# # list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# # p list.shift                      # removes and returns the first item in list

# # pop
# # p list.pop                        # removes and returns the last item in list

# # remove_at
# # list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# # list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# puts list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym