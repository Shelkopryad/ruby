require_relative 'class'

@cl = TestClass.new
def test
  if @cl.multyply(1) == 5
    puts true
  end
end

def test1
  if @cl.multyply(5) == 25
    puts true
  end
end

test
test1
