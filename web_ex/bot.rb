require 'cleverbot'

bot = Cleverbot.new('secret', 'key')

p "Привет, я Cleverbot"

loop do
  usr_ans = gets.chomp
  break if usr_ans == "end"
  p bot.say "#{usr_ans}"
end
