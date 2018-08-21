require_relative 'stack.rb'

def paren_match(str)
  stack = Stack.new
  lsym = "{[(<"
  rsym = "}])>"
  str.each_char do |sym|
    if lsym.include? sym
      stack.push sym
    elsif rsym.include? sym
      top = stack.peek
      if lsym.index(top) != rsym.index(sym)
        return false
      else
        stack.pop
      end
    end
  end
  return stack.empty?
end

str1 = "{(sdf<sdfs)}+[sdf{dgdfg(sdfs)}]"
str2 = "[sdf{dfgdf}]-(dfgdfg<sdf>)"

p paren_match str1
p paren_match str2
