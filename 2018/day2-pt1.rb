
doubles = 0
tripples = 0
double = false
tripple = false
File.open('day2.txt').each do |line|
	
	line = line.chomp.chars.sort.join
	for i in (0..24) do
		if line[i] == line[i+1] 
			if i < 24 and line[i] == line[i+2] and tripple == false
				tripple = true
			elsif double == false and line[i] != line[i+2] and line[i] != line[i-1]
				double = true
			end
		end
	end
	if tripple
		tripples += 1
		tripple = false
	end
	if double
		doubles += 1
		double = false
	end
end
puts doubles * tripples