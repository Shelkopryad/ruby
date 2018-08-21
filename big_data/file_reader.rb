require 'unicode'
require 'yomu'
require 'find'

class FileReader

  def initialize(path)
    @path = path
  end

  def open_files

    Dir.entries(@path).each do |file|
      if file =~ /[a-zа-я0-9]+\S(txt|fb2)/i
        File.open(file, "r:UTF-8").each do |line|
          yield(file, line)
        end
      # todo open and read ms_office files
      # elsif file =~ /[a-zа-я0-9]+\S(doc|docx)/i
      #   yomu = Yomu.new("#{@path}/file")
      #   text = yomu.text
      end
    end
  end

  def search(regex)
    open_files do |file, line|
      p "#{file}: #{line.chomp}" if line =~ regex
    end
  end

  def select_top_of_words(hash, top_x)
    tmp = Hash.new
    hash.sort_by { |word, entry| entry }.reverse.each_with_index do |(k, v), i|
      tmp[k] = v if i <= top_x-1
    end
    tmp
  end

  def counter(top_x)
    words = Hash.new
    count = 0
    open_files do |file, line|
      line.chomp.split.each do |word|
        words[Unicode::downcase(word)] ||= 0
        words[Unicode::downcase(word)] += 1
        count += 1
      end
    end
    p "#{count} words in texts"
    tops = select_top_of_words words, top_x
    p tops
  end
end



path = "/home/shelkopryad/work/repos/free_projects/ruby/big_data"
regex = /рассказ/i
s = FileReader.new path
s.search regex
s.counter 20
