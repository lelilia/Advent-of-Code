class Orbits
	attr_accessor :orbits

	def initialize
		@orbits = Hash.new{|hash, key| hash[key] = []}
	end

	def add_orbit(a,b)
		@orbits[b] << a 
	end

	def how_many_orbits(a,b,depth)
		return depth if a == b
		depth = depth + 1
		how_many_orbits(a, @orbits[b][0], depth) 
	end

end


orbits_in_this_puzzle = Orbits.new
list_of_all_the_planets = []

File.open('day6.txt').each do |line|
	pathway =  line.split(")")
	orbits_in_this_puzzle.add_orbit(pathway[0],pathway[1].chop)
	list_of_all_the_planets.append(pathway[1].chop)
end

res = 0
list_of_all_the_planets.each do |planet|
	res += orbits_in_this_puzzle.how_many_orbits("COM",planet,0)
end
p res
