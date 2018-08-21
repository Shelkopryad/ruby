class Link < Post

  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts "Адрес ссылки?"
    @url = gets.chomp

    puts "Что за ссылка?"
    @text = gets.chomp
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\n"
    return [@url, @text, time_string]
  end
end