#!/usr/bin/ruby

#Let's build a tree

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

  def inorder_traverse(&block)
    @left.inorder_traverse(&block) unless @left==nil
    yield @data
    @right.inorder_traverse(&block) unless @right==nil
  end

  def depth_traverse(&block)
    @left.depth_traverse(&block) unless @left==nil
    @right.depth_traverse(&block) unless @right==nil
    yield @data
  end

  def to_s
    @left.to_s + @data.to_s + @right.to_s
  end

end

t = Tree.new(" ")

text = "Now is the winter of our discontent, made glorious summer by this son of York"

puts "Sorting \"#{text}\""

#Build the tree
text.split.each {|word| t.add word}

sorted = []
t.inorder_traverse {|i| sorted.push i}

print "#{sorted.join ' '}"

puts
