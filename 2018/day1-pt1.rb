res = 0

File.open('day1.txt').each do |line|
	res += line.to_i
end
puts res