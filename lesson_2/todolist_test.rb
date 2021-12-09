require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done_question
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end
  
  def test_type_error
    assert_raises(TypeError) { @list << "string" }
    assert_raises(TypeError) { @list.add(1) }
  end
  
  def test_shovel
    new_todo = Todo.new("Take out the trash")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    new_todo = Todo.new("Take out the trash")
    @list.add(new_todo)
    @todos.push(new_todo)
    assert_equal(@todos, @list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
  end
  
  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_to_s_1
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    @todo1.done! # or, @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_each_iterating
    result = []
    @list.each do |todo|
      result << todo
    end
    
    assert_equal([@todo1, @todo2, @todo3], result)
  end
  
  def test_each_returning
    assert_same(@list, @list.each {}) # could add block_given? to not need block
    assert_equal(@list, @list.each {}) # same thing because no custom == method
  end
  
  def test_select
    @list.mark_done_at(0)
    new_list = @list.select { |todo| todo.done? }
    assert_equal([@todo1], new_list.to_a)
  end
  
  def test_select_book
    @todo1.done!
    new_list = TodoList.new(@list.title)
    new_list.add(@todo1) # this is marked done
  
    assert_equal(new_list.title, @list.title) # compares the title of both lists to make sure the to_s of both lists are the same, since to_s uses the title
    assert_equal(new_list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end