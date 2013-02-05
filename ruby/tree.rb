#!/usr/bin/ruby

#Let's build a tree

class Empty
end

class Tree
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left=nil
    @right=nil
  end

  def add(data)
    if data <= @data then
      if @left == nil then
        @left = Tree.new(data)
      else
        @left.add(data)
      end
    else
      if @right == nil then
        @right = Tree.new(data)
      else
        @right.add(data)
      end
    end
  end

  def traverse(&block)
    @left.traverse(&block) unless @left==nil
    yield @data
    @right.traverse(&block) unless @right==nil
  end

  def to_s
    puts @left
    puts @data
    puts @right
  end

end

t = Tree.new(7)
t.add(4)
t.add(9)
t.add(1)
t.add(8)

t.traverse {|i| puts "Found #{i}"}
