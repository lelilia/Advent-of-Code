# # https://adventofcode.com/2019/day/10
require "set"

def to_degree(phi)
	return [(90+ phi[0] * 180 / Math::PI)%360, phi[1]]
end

def polar_phi(a,b)
	x = b[0] - a[0]
	y = b[1] - a[1]
	return [Math.atan2(x,y),(x**2 + y**2)**0.5] # changing the axis here because I want 0 to be on top
end

def to_rad(phi)
	return (phi - 90) * Math::PI / 180
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
		all_the_angles.push to_degree(polar_phi(a1, a2))[0] if i!=j
	end
	# set so only unique angles and than length for the number of unique angles
	@angles.push all_the_angles.to_set.length
end
p "Part 1"
p @angles.max()

# Part 2
def get_the_200()
	@station = @asteroids[@angles.index(@angles.max())]
	p "Part 2"

	@asteroids.delete @station
	all_the_asteroids = []
	@asteroids.each do |asteroid|
		all_the_asteroids.push to_degree(polar_phi(@station, asteroid))
	end
	all_the_asteroids = all_the_asteroids.sort
	i = 0
	number_of_asteroids_destroid = 0
	last_angle = -1 # to start from before 0
	while true
		if all_the_asteroids[i][0] != last_angle
			if number_of_asteroids_destroid == 199
				return all_the_asteroids[i]
			end
			all_the_asteroids[i], last_angle = nil, all_the_asteroids[i][0]
			number_of_asteroids_destroid += 1
		end
		i = (i+1)%all_the_asteroids.length
	end
end
phi, r = get_the_200

y_res =  (@station[0] + r * Math.sin(to_rad(phi))+0.5).to_i
x_res =  ((@station[1] +r * Math.cos(to_rad(phi)))+0.5).to_i

p x_res*100+y_res 