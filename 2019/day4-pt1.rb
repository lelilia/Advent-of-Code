# https://adventofcode.com/2019/day/4

def password_test(password)
	array = []
	while password > 0
		array.unshift(password%10)
		password = password / 10
	end
	is_there_a_double = false
	(0..4).each do |i|
		if array[i] == array[i+1]
			is_there_a_double = true
		end
	end
	if is_there_a_double == false
		return false
	end
	(0..4).each do |i|
		if array[i] > array[i+1]
			return false
		end
	end
	return true
end



number_of_possible_passwords = 0
(245318..765747).each do |password|
	if password_test(password)
		number_of_possible_passwords += 1
	end
end
puts number_of_possible_passwords

