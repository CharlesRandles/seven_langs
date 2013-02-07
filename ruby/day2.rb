#!/usr/bin/ruby
#Start with the easy things

elems=(0..15).to_a #Array of 16 elements

#Print by 4s, using each
count=0
elems.each do |elem|
  print elem.to_s + "\t"
  count = count + 1
  if count % 4 == 0 then
    print "\n"
  end
end

#Print by 4s using each_slice
elems.each_slice(4) {|slice| print "#{slice}\n" }

#The first way was prettier, but let's make the output identical
accum=[]
elems.each do |elem|
  accum.push elem
  count = count + 1
  if accum.count == 4 then
    print "#{accum}\n"
    accum=[]
  end
end
