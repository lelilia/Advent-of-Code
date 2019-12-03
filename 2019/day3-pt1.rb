require "set"

def go_one_step(start, direction)
	length_of_step = direction[1..].to_i

	result = []
	if direction[0] == "R"
		#go right => change x to bigger
		y = start[1]
		(start[0]..start[0]+length_of_step).each do |x|
			result.push [x,y]
		end
	elsif direction[0] == "L"
		#go left => change x to smaller
		y = start[1]
		(start[0]).downto(start[0]-length_of_step) do |x|
		# (start[0]-length_of_step..start[0]).each do |x|
			result.push [x,y]
		end
	elsif direction[0] == "U"
		#go up => change y to higher
		x = start[0]
		(start[1]..start[1]+length_of_step).each do |y|
		# (start[1]..start[1]+length_of_step).each do |y|
			result.push [x,y]
		end
	elsif direction[0] == "D"
		#go down => change y to smaller
		x = start[0]
		(start[1]).downto(start[1]-length_of_step) do |y|
			result.push [x,y]
		end
	end
	return result
end
		

wire1 = []
wire2 = []
lines = []

File.open('day3.txt').each do |line|
	lines.push line
end

wire1 = lines[0].chomp.split(',')
wire2 = lines[1].chomp.split(',')

path_wire1 = [[[0,0]]]
path_wire2 = [[[0,0]]]

wire1.each do |step|
	path_wire1.push go_one_step(path_wire1[-1][-1], step)
end

wire2.each do |step|
	path_wire2.push go_one_step(path_wire2[-1][-1], step)
end

set_wire1 = path_wire1.flatten(1).to_set
set_wire2 = path_wire2.flatten(1).to_set

intersections = set_wire1.intersection(set_wire2)
puts intersections

distances = []
intersections.each do |i|
	distances.push i[0].abs()+i[1].abs()
end
puts distances.min(2)

