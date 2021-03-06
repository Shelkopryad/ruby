require 'date'

class Task < Post

  def initialize
    super
    @due_date = Time.now
  end

  def read_from_console
    puts "Что надо сделать?"
    @text = gets.chomp

    puts "К какому числу?"
    input = gets.chomp

    @due_date = Date.parse input
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\n"
    dead_line = "Крайний срок: #{@due_date}"
    return [dead_line, @text, time_string]
  end

end