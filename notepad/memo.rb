class Memo < Post

  def read_from_console
    puts "Новая заметка (писать до строчки \"end\")"

    @text = []
    line = nil

    while line != "end" do
      line = gets.chomp
      @text << line
    end
    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\n"
    return @text.unshift(time_string)
  end

end