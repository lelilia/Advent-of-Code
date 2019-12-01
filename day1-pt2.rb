total_fuel = 0

File.open('day1.txt').each do |line|
	fuel = 0
	adding = line.to_i
	while adding > 6
		adding = adding/3 - 2
		fuel += adding
	end
	total_fuel += fuel
end
puts total_fuel

