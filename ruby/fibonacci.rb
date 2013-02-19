def bad_fib(n)
  print("\tin bad_fib(#{n})\n")
  if n < 2 then
    1
  else
    bad_fib(n-1) + bad_fib(n-2)
  end
end

def good_fib_helper(a,b,n)
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

n=7
print("bad_fib(#{n}) = #{bad_fib(n)}\n")
print("***********************************\n")
print("good_fib(#{n}) = #{good_fib(n)}\n")d_fib(n)}\n")
print("***********************************")
print("good_fib(#{n}) = #{good_fib(n)}\n")
