# https://adventofcode.com/2019/day/1

total_fuel = 0

File.open('day1.txt').each do |line|
	total_fuel += line.to_i/3 - 2
end
puts total_fuel