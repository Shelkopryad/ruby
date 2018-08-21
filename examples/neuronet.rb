# n = Time.now.hour
# a = {hour: 2, min: 3}
# puts n + a[:hour]

num0 = "0111010001100011000110001100011000101110"
num1 = "0001100110011101101000010000100001000010"
num2 = "0111101001110011000100011001100110011111"
num3 = "0111111001100110011000011100011100101111"
num4 = "0010000100010010100111111000010000100001"
num5 = "0111101000110001011011001000011000101110"
num6 = "0111010001100001111010001100011000101110"
num7 = "1111100001000110001000110001000010000100"
num8 = "0111010001100010111010001100011000101110"
num9 = "0111010001100011000101111000011000101110"
 
# Список всех вышеуказанных цифр
nums = [num0, num1, num2, num3, num4, num5, num6, num7, num8, num9]
 
# Виды цифры 5 (Тестовая выборка)
num51 = "0111100000110001011011001010011000101110"
num52 = "0111101000110001011011001000011000101110"
num53 = "0110101010110001011011001000010000101110"
num54 = "0011101000101001011011001000110000101111"
num55 = "0110101000101001011011001010011000111110"
num56 = "1011101000100001011011001000001000101110"
 
# Инициализация весов сети
@weights = []

(1..40).each do |i|
	@weights << 1
end
 
# Порог функции активации
@bias = 7
 
# Является ли данное число 5
def proceed(number)
    # Рассчитываем взвешенную сумму
    # puts "in proceed"
  net = 0
  (0...40).each do |i|
    net += number[i].to_i*@weights[i]
 	end
    # Превышен ли порог? (Да - сеть думает, что это 5. Нет - сеть думает, что это другая цифра)
  # puts "#{net}: #{net >= @bias}"
  return net >= @bias
end
 
# Уменьшение значений весов, если сеть ошиблась и выдала 1
def decrease(number)
	# puts "in decrease"
	(0...40).each do |i|
		if number[i].to_i == 1
      @weights[i] = @weights[i] - 1
    end
  end
end
        
 
# Увеличение значений весов, если сеть ошиблась и выдала 0
def increase(number)
	# puts "in increase"
  (0...40).each do |i|
        # Возбужденный ли вход
    if number[i].to_i == 1
            # Увеличиваем связанный с ним вес на единицу
      @weights[i] = @weights[i] + 1
    end
  end
end
 
# Тренировка сети
100.times do
	option = rand(9) + 1
	# puts option.to_s
	if option != 5
		decrease(nums[option]) if proceed(nums[option])
  else
    increase(num5) unless proceed(num5)
  end
end
 
# Вывод значений весов
print @weights
puts

 
# Прогон по обучающей выборке
puts "0 or 5: #{proceed(num0)}"
puts "1 or 5: #{proceed(num1)}"
puts "2 or 5: #{proceed(num2)}"
puts "3 or 5: #{proceed(num3)}"
puts "4 or 5: #{proceed(num4)}"
puts "5 or 5: #{proceed(num5)}"
puts "6 or 5: #{proceed(num6)}"
puts "7 or 5: #{proceed(num7)}"
puts "8 or 5: #{proceed(num8)}"
puts "9 or 5: #{proceed(num9)}"
# proceed(num1)
# proceed(num2)
# proceed(num3)
# proceed(num4)
# proceed(num6)
# proceed(num7)
# proceed(num8)
# proceed(num9)
 
# # # Прогон по тестовой выборке
puts "proceed(num5)   :  #{proceed(num5)}"
puts "proceed(num51)  :  #{proceed(num51)}"
puts "proceed(num52)  :  #{proceed(num52)}"
puts "proceed(num53)  :  #{proceed(num53)}"
puts "proceed(num54)  :  #{proceed(num54)}"
puts "proceed(num55)  :  #{proceed(num55)}"
puts "proceed(num56)  :  #{proceed(num56)}"
