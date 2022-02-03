class Element
  attr_reader :datum

  def initialize(datum, link = nil)
    @datum = datum
    @link = link
  end

  def tail?
    @link.nil?
  end

  def next
    @link
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def push(datum)
    element = Element.new(datum, head)
    self.head = element
  end

  def pop
    old_head = head
    new_head = old_head.next
    self.head = new_head
    old_head.datum
  end

  def size
    count = 0
    current_element = head
    until current_element.nil?
      count += 1
      current_element = current_element.next
    end
    count
  end

  def empty?
    head.nil?
  end

  def peek
    return nil if empty?
    head.datum
  end

  def to_a
    array = []
    current_element = head
    until current_element.nil?
      array << current_element.datum
      current_element = current_element.next
    end
    array
  end

  def self.from_a(array)
    return SimpleLinkedList.new if array.nil?
    new_linked_list = SimpleLinkedList.new
    array.reverse.each do |datum|
      new_linked_list.push(datum)
    end
    new_linked_list
  end

  def reverse
    data = to_a.reverse
    SimpleLinkedList.from_a(data)
  end
end
