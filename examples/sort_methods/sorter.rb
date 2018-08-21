class Sorter

  def selection_sort(arr)
    for i in 0...arr.length
      min, min_i = arr[i], i

      for j in (i+1)...arr.length
        min, min_i = arr[j], j if arr[j] < min
      end
      arr[i], arr[min_i] = arr[min_i], arr[i] if i != min_i
    end
    p arr
  end

  def bubble_sort(arr)
    for j in 0...arr.length-1
      for i in 0...arr.length-1
        arr[i], arr[i+1] = arr[i+1], arr[i] if arr[i] > arr[i+1]
      end
    end
    p arr
  end

  # def q_sort(arr)
  #   [] if arr.empty?
  #   left, right = arr.partition { |y| y <= arr.first }
  #   q_sort(left) + [ arr.first ] + q_sort(right)
  #   p arr
  # end




end

s = Sorter.new
a = [1, 5, 3, 7, 2, 0, 4, 9, 8]
s.selection_sort a
s.bubble_sort a
# s.q_sort a
