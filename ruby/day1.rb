#!/usr/bin/ruby

puts "Hello, World!"

source="Hello, Ruby"
target="Ruby"
idx=source.index(target)
if idx==nil then idx=" nowhere" end

puts ("In the string \"#{source}\" the string \"#{target}\" appears at index #{idx}.")

name="Charles"

10.times {puts name}

10.times {|i| puts "This is sentence number #{i+1}"}

n = rand(100)
puts "I've thought of a number. Have a guess:"

guess = gets.to_i

while guess != n
  if n > guess then
    puts "Higher..."
  else
    puts "Lower..."
  end
  guess = gets.to_i
end
puts "Correct!"
