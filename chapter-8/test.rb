def add(x, y)
  x + y
end

p(add(1, 1))

def foo()
  x = 0
  p(x)
end

x = 1
foo()
p(x)

def fib(x)
  if x <= 1
    x
  else
    fib(x - 1) + fib(x - 2)
  end
end

i = 0
while i <= 10
  p(fib(i))
  i = i + 1
end
