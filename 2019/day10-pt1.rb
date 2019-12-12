# https://adventofcode.com/2019/day/10

require "set"

# calculate the phi angle 
def polar_phi(a,b)
	x = b[0] - a[0] + 0.0
	y = b[1] - a[1]
	return Math.atan(y/x) if x > 0
	return (Math.atan(y/x) + Math::PI) if x < 0 and y >= 0
	return (Math.atan(y/x) - Math::PI) if x < 0 and y < 0
	return Math::PI/2 if x == 0 and y > 0
	return - Math::PI / 2 if x == 0 and y < 0
end


# map all the asteroids from the file
@asteroids = []
File.open('day10.txt').each_with_index do |line, col|
	line.chars.each_with_index do |char, row|
		@asteroids.push [col,row] if char == "#"
	end
end

@angles = []
# calculate the angles from each asteroid to all the others
@asteroids.each_with_index do |a1, i|
	all_the_angles = []
	@asteroids.each_with_index do |a2, j|
		all_the_angles.push polar_phi(a1, a2) if i!=j
	end
	# set so only unique angles and than length for the number of unique angles
	@angles.push (all_the_angles.to_set).length
end
p @angles.max()
