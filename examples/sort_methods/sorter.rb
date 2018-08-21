class Sorter

  def selection_sort(arr)
    for i in 0...arr.length
      min, min_i = arr[i], i

      for j in (i+1)...arr.length
        min, min_i = arr[j], j if arr[j] < min
      end
      arr[i], arr[min_i] = arr[min_i], arr[i] if i != min_i
    end
    arr
  end

  def bubble_sort(arr)
    for j in 0...arr.length-1
      for i in 0...arr.length-1
        arr[i], arr[i+1] = arr[i+1], arr[i] if arr[i] > arr[i+1]
      end
    end
    arr
  end

  def quick_sort(arr)
    if arr.length < 2
      arr
    else 
      pivot = arr[0]
      less = arr.select { |a| a < pivot }
      greater = arr.select { |a| a > pivot }
      quick_sort(less) + [pivot] + quick_sort(greater)
    end
  end
  
end

s = Sorter.new
a = [8, 5, 3, 7, 2, 0, 4, 9, 1]
p s.selection_sort a
p s.bubble_sort a
p s.quick_sort a
# s.q_sort a
