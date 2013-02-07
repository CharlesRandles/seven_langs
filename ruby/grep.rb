#A trivial grep
def check_argv
  ARGV.count == 2
end

def grep (pattern, filename)
  f=File.open filename, "r"
  line_number=1
  f.each do |line|
    puts "#{line_number}:\t#{line}" unless (/#{pattern}/=~line) == nil
    line_number = line_number + 1
  end
end

if check_argv then
  pattern = ARGV[0]
  filename = ARGV[1]
  grep pattern, filename
else
  puts "Usage: ruby grep <pattern> <file>"
end
