require 'thread'
require 'timeout'

=begin
factoriallOOO = Thread.new do
	begin
		prod = 1
		1.upto(1000) { |n| prod *= n }
		p "1000! = #{prod}"
	rescue
			# Ничего не делать ...
	end
end

factoriallOOO.join
=end

=begin
def new_value(i)
	i + 1
end

x = 0
mutex = Mutex.new

t1 = Thread.new do
	1.upto(1000000) do
		mutex.lock
		x = new_value(x)
		mutex.unlock
	end
end

t2 = Thread.new do
	1.upto(1000000) do
		mutex.lock
		x = new_value(x)
		mutex.unlock
	end
end

t1.join
t2.join
p x
=end

=begin
buffer = SizedQueue.new(2)

producer = Thread.new do
	item = 0
	loop do
		sleep(rand * 0.1)
		p "Производитель произвёл #{item}"
		buffer.enq item
		item += 1
	end
end

consumer = Thread.new do
	loop do
		sleep((rand 0.1)+0.09)
		item = buffer.deq
		p "Потребитель потребил #{item}"
		p " ожидает - #{buffer.num_waiting}"
	end
end

sleep 10
=end

=begin
@music  = Mutex.new
@violin = ConditionVariable.new
@bow    = ConditionVariable.new

@violins_free = 2
@bows_free    = 1

def musician(n)
	loop do
		sleep rand 0
		@music.synchronize do
			@violin.wait(@music) while @violins_free == 0
			@violins_free -= 1
			p "#{n} владеет скрипкой"
			p "скрипок #{@violins_free}, смычков #{@bows_free}"

			@bow.wait(@music) while @bows_free == 0
			@bows_free -= 1
			p "#{n} владеет смычком"
			p "скрипок #{@violins_free}, смычков #{@bows_free}"
		end
		sleep rand 0
		p "#{n}: (...играет...)"
		sleep rand 0
		p "#{n}: Я закончил."

		@music.synchronize do
			@violins_free += 1
			@violin.signal if @violins_free == 1
			@bows_free += 1
			@bow.signal if @bows_free == 1
		end
	end
end

threads = []
3.times { |i| threads << Thread.new { musician i } }
threads.each { |t| t.join }
=end


flag = false
answer = nil

begin
	timeout(5) do
		p "Хочу печенье"
		answer = gets.chomp
		flag = true
	end
rescue Timeout::Error
	flag = false
end

if flag
	if answer = "cookie"
		p "Спасибо, жую"
	else
		p "Это не печенье"
		exit
	end
else
	p "Слишком медленно"
	exit
end

p "До встречи"
