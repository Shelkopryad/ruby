class Greetings

  def initialize(text)
    @text = text
  end

  def welcome
    p @text
  end

end

g = Greetings.new("Asdasd")
p g.class
p g.class.instance_methods(false)
p g.instance_variables