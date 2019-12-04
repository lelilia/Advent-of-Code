require 'set'

all_possible_ids = []
# define the fabric

fabric = []
(0..1000).each do |i|
	row = []
	(0..1000).each do |j|
		row.push ""
	end
	fabric.push row
end

# input all the claims
claims = ["#1 @ 1,3: 4x4","#2 @ 3,1: 4x4","#3 @ 5,5: 2x2"]
claims = []
File.open('day3.txt').each do |line|
	claims.push line
end

claims.each do |claim|
	claim = claim.split(" ")
	id = claim[0][1..].to_i
	all_possible_ids.push id
	start_point = claim[2].chop.split(",")
	start_x = start_point[0].to_i
	start_y = start_point[1].to_i
	area = claim[3].split("x")
	width = area[0].to_i
	height = area[1].to_i

	#act on the claim
	(start_x..start_x+width-1).each do |x|
		(start_y..start_y+height-1).each do |y|
			fabric[x][y] += id.to_s+","
		end
	end
end
doubled_fabric_pieces = []
(0..1000).each do |i|
	(0..1000).each do |j|
		if fabric[i][j].count(",") > 1
			fabric[i][j].split(",").each do |id_on_doubles|
				doubled_fabric_pieces.push id_on_doubles.to_i
			end
		end
	end
end

doubled_fabric_pieces = doubled_fabric_pieces.to_set
all_possible_ids = all_possible_ids.to_set


puts all_possible_ids.difference(doubled_fabric_pieces)
