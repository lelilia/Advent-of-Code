def get_index(mode, i, rel_base)
	if mode % 10 == 0
		@int_code[@int_code[i]] ||= 0
		return @int_code[i]
	elsif mode % 10 == 1
		@int_code[i] ||= 0
		return i 
	else
		@int_code[rel_base + @int_code[i]] ||= 0
		return rel_base + @int_code[i]
	end
end

def run_int_computer(int_code)
	i = 0

	rel_base = 0
	while i < @int_code.length
		# p "#{@int_code} int_code"
		# p "i ist #{i} und rel_base ist #{rel_base}"
		modes = @int_code[i] / 100
		if @int_code[i] % 100 == 1
			@int_code[get_index(modes/100, i + 3, rel_base)] = @int_code[get_index(modes, i+1, rel_base)] + @int_code[get_index(modes/10, i+2, rel_base)]
			i += 4
		elsif @int_code[i] % 100 == 2
			@int_code[get_index(modes/100, i + 3, rel_base)] = @int_code[get_index(modes, i+1, rel_base)] * @int_code[get_index(modes/10, i+2, rel_base)]
			i += 4
		elsif @int_code[i] % 100 == 3
			@int_code[get_index(modes, i+1, rel_base)] = @input 
			i += 2
		elsif @int_code[i] % 100 == 4
			p @int_code[get_index(modes, i + 1, rel_base)]
			i += 2
		elsif @int_code[i] % 100 == 5
			if @int_code[get_index(modes, i+1, rel_base)] != 0
				i = @int_code[get_index(modes/10, i + 2, rel_base)] 
			else 
				i += 3
			end
		elsif @int_code[i] % 100 == 6
			if @int_code[get_index(modes, i+1, rel_base)] == 0
				i = @int_code[get_index(modes/10, i+2, rel_base)]
			else
				i += 3
			end
		elsif @int_code[i] % 100 == 7
			if @int_code[get_index(modes, i+1, rel_base)] < @int_code[get_index(modes/10, i+2, rel_base)]
				@int_code[get_index(modes/100, i+3, rel_base)] = 1
			else
				@int_code[get_index(modes/100, i+3, rel_base)] = 0
			end
			i += 4
		elsif @int_code[i] % 100 == 8
			if @int_code[get_index(modes, i+1, rel_base)] == @int_code[get_index(modes/10, i+2, rel_base)]
				@int_code[get_index(modes/100, i+3, rel_base)] = 1
			else
				@int_code[get_index(modes/100, i+3, rel_base)] = 0
			end
			i += 4
		elsif @int_code[i] % 100 == 9
			rel_base += @int_code[get_index(modes, i+1, rel_base)]
			i += 2
		elsif @int_code[i] == 99
			return @int_code
			break
		end

	end

end