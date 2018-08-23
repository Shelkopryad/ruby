require_relative 'stack.rb'

# with no recursion
def towers(list)
  while !list.empty?
    n, src, dst, aux = list.pop
    if n == 1
      p "Перемещаем диск с #{src} на #{dst}"
    else
      list.push [n-1, aux, dst, src]
      list.push [1, src, dst, aux]
      list.push [n-1, src, aux, dst]
    end
  end
end

list = []
list.push([3, "a", "c", "b"])
towers list

# with recursion
def towers_recursion(n, src, dst, aux)
  if n == 1
    p "Перемещаем диск с #{src} на #{dst}"
  else
    towers_recursion(n-1, src, aux, dst)
    towers_recursion(1, src, dst, aux)
    towers_recursion(n-1, aux, dst, src)
  end
end

towers_recursion(3, "a", "c", "b")
