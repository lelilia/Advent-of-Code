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
			if (i == 0 or array[i-1] != array[i]) and (i == 4 or array[i+2] != array[i])
				is_there_a_double = true
			end
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

puts password_test(112233)
puts password_test(123444)
puts password_test(111122)