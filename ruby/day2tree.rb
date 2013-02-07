#Tree from Day 2 exercises

#The data
family={
  'grandpa' => 
  { 
    'dad' => 
    {
      'child 1' => {}, 'child 2' => {} 
    }, 
    'uncle' => 
    {
      'child 3' => {},
      'child 4' => {} 
    } 
  } 
}

simple_family = {
  'mother' =>
  {
    'daughter' => {}
  }
} 

class Tree
  attr_accessor :name, :children

  def initialize(data)
    @name = data.keys[0]
    @children=[]
    #print "debug: @name=#{@name}\n" 
    if data[@name] != {} then #Don't create empty children
      data[@name].each {|k,v| @children.push Tree.new( {k => v}) }
    end
  end

  def each(&block)
    yield @name
    children.each {|child| child.each &block}
  end

  def print(tab_depth=0)
    tabs = ""
    tab_depth.times {tabs = tabs + "\t"}
    puts "#{tabs}#{@name}\n"
    children.each {|child| child.print (tab_depth + 1)}
  end

end

t=Tree.new family
t.print

t.each {|x| print "#{x}:"}
