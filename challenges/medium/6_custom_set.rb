class CustomSet
  def initialize(set = [])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other)
    set.all? { |element| other.contains?(element) }
  end

  def disjoint?(other)
    set.none? { |element| other.contains?(element) }
  end

  def eql?(other)
    set.sort == other.set.sort
  end

  def add(element)
    set << element unless contains?(element)
    self
  end

  def intersection(other)
    new = CustomSet.new
    set.each { |element| new.add(element) if other.contains?(element) }
    new
  end

  def difference(other)
    new = CustomSet.new
    set.each { |element| new.add(element) unless other.contains?(element) }
    new
  end

  def union(other)
    new = CustomSet.new
    set.each { |element| new.add(element) }
    other.set.each { |element| new.add(element) }
    new
  end

  def ==(other)
    eql?(other)
  end

  protected

  attr_accessor :set
end
