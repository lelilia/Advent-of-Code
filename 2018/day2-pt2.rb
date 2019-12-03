def testing_two_strings(string1, string2)
	one_letter_diff = false
	more_than_one_letter_diff = false
	(0..string1.length - 1).each do |letter|
		if string1[letter] != string2[letter]
			if one_letter_diff == false
				one_letter_diff = true
			else
				more_than_one_letter_diff = true
				break
			end
		end
	end
	if more_than_one_letter_diff == false
		return more_than_one_letter_diff
	end
	return more_than_one_letter_diff
end

def return_string_without_difference(string1, string2)
	return_string = ""
	(0..string1.length-1).each do |letter|
		if string1[letter] == string2[letter]
			return_string += string1[letter]
		end
	end
	return return_string
end


array_of_input = []
File.open('day2.txt').each do |line|
	array_of_input.push line.chomp
end

array_testing_against = array_of_input.dup
array_testing = array_of_input.dup

length_of_array = array_of_input.length
length_of_string = array_of_input[0].length


(0..length_of_array - 2).each do |i|
	(i+1..length_of_array-1).each do |j|
		if testing_two_strings(array_testing_against[i], array_testing[j]) == false
			puts return_string_without_difference(array_testing_against[i], array_testing[j])
			return true
		end
	end
end




