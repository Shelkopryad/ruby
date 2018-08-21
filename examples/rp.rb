Shoes.app width: 350, height: 240 do
	def make_pass
	  str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_";
	  pass = ""
	  15.times do
	    pass << str[rand(63)]
	  end
	  pass
	end

	stack width:220, margin: 10 do
		@src = edit_line width: 100
		@log = edit_line width: 100
		button("Generate") {
			@pass = make_pass
			@result.clear
			@result.append do
				caption "#{@pass}"
			end
		}
		button("Save") {
			file = File.open("pass.txt", "a")
			file.puts "#{@src.text}, #{@log.text}: #{@pass}"
			file.close
		}

		@result = stack width: -220, margin: 20
	end
end