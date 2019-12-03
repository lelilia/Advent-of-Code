list_of_input = []
File.open('day1.txt').each do |line|
	list_of_input.push line.to_i
end
had_that_frequency = [0]
puts [0,1,2,3,4,5].include?4
while true 
	list_of_input.each do |change|
		new_frequency = had_that_frequency[-1] + change
		#if new_frequency in had_that_frequency
		if had_that_frequency.include?new_frequency
			puts "the anwser is "+ new_frequency.to_s
			return true
		else 
			had_that_frequency.push new_frequency
		end
	end
end

