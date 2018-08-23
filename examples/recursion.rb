def rec(n)
  return n if n == 1
  return rec(n-1)*n
end

p rec(10)

def rec2(n)
  return n if n == 1
  return rec2(n-1)
end

p rec2(10)

def fib(n)
  if ((n == 1) || (n == 2))
    return 1
  end
  fib(n-1) + fib(n-2)
end

def factorial(n)
  if n <= 1
    1
  else
    n * factorial(n-1)
  end
end

# alternative
def factorial2(n)
  n.zero? ? 1 : n * factorial(n-1)
end

(1..10).each do |i|
  # p rec i
  # p rec2 i
  p fib i
end
