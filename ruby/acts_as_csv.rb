#!/usr/bin/ruby
 
class CsvRow
  def initialize(headers, line)
    @headers = headers
    @cells = line
  end
 
  def method_missing name, *args
    col = name.to_s
    col_index = @headers.index col
    @cells[col_index]
  end
end
 
module ActsAsCsv
 
  def self.included(base)
    base.extend ClassMethods
  end
 
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
 
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + ".txt"
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
      @csv_contents << row.chomp.split(', ')
      end
    end
   
    attr_accessor :headers, :csv_contents
 
    def initialize
      read
    end
 
    def each
      @csv_contents.each do |row|
      yield CsvRow.new headers, row
      end
    end
 
    def to_s
      s=headers.to_s + "\n"
      csv_contents.each do |line|
      s = s + line.to_s + "\n"
      end
      s
    end
  end
end
 
class RubyCsv
  include ActsAsCsv
  acts_as_csv
end
 
csv=RubyCsv.new
#puts csv
csv.each {|row| puts row.Model}
 
