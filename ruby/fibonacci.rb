class Fib_Counter
  attr_accessor :count

  def initialize()
    @count = 0
  end

  def bad_fib(n)
    @count = @count + 1
    print("\tin bad_fib(#{n})\n")
    if n < 2 then
      1
    else
      bad_fib(n-1) + bad_fib(n-2)
    end
  end

  def good_fib_helper(a,b,n)
    @count = @count + 1
    print("\tin good_fib_helper(#{n})\n")
    if n <= 2 then
      b
    else
      good_fib_helper(b, a+b, n-1)
    end
  end

  def good_fib(n)
    good_fib_helper(1,1,n+1)
  end
end

n=7
bad = Fib_Counter.new
print("bad_fib(#{n}) = #{bad.bad_fib(n)}\n")
print("#{bad.count} calls.\n")
print("***********************************\n")
good=Fib_Counter.new
print("good_fib(#{n}) = #{good.good_fib(n)}\n")
print("#{good.count} calls.\n")
