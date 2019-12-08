# https://adventofcode.com/2019/day/7

# the code of my int computer 
def run_int_code(int_code, input, i)
	

	while i < int_code.length
		modes = int_code[i] / 100
		if int_code[i]%10 == 1
			if modes%10 == 1
				res = int_code[i+1]
			else
				res = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if modes%10 == 1
				res += int_code[i+2]
			else
				res += int_code[int_code[i+2]]
			end
			modes = modes / 10
			if modes % 10 == 1
				int_code[i+3] = res
			else
				int_code[int_code[i+3]] = res
			end
			i += 4
		elsif int_code[i]%10 == 2
			if modes%10 == 1
				res = int_code[i+1]
			else
				res = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if modes % 10 == 1
				res *= int_code[i+2]
			else
				res *= int_code[int_code[i+2]]
			end
			modes = modes / 10
			if modes % 10 == 1
				int_code[i+3] = res
			else
				int_code[int_code[i+3]] = res
			end
			i += 4
		elsif int_code[i]%10 == 3
			if modes % 10 == 1
				int_code[i+1] = input.shift
			else
				int_code[int_code[i+1]] = input.shift
			end
			i += 2
		elsif int_code[i] % 10 == 4
			if modes % 10 == 1
				#puts int_code[i+1]
				return [int_code[i+1], i+2]
			else
				return [int_code[int_code[i+1]], i+2]
			end
			i += 2
		elsif int_code[i] % 10 == 5
			if modes % 10 == 1
				check_par = int_code[i+1]
			else
				check_par = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if check_par != 0
				if modes % 10 == 1
					i = int_code[i+2]
				else
					i = int_code[int_code[i+2]]
				end
			else
				i += 3
			end
		elsif int_code[i] % 10 == 6
			if modes % 10 == 1
				check_par = int_code[i+1]
			else
				check_par = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if check_par == 0
				if modes % 10 == 1
					i = int_code[i+2]
				else
					i = int_code[int_code[i+2]]
				end
			else
				i += 3
			end
		elsif int_code[i] % 10 == 7
			if modes % 10 == 1
				par1 = int_code[i+1]
			else
				par1 = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if modes % 10 == 1
				par2 = int_code[i+2]
			else 
				par2 = int_code[int_code[i+2]]
			end
			modes = modes / 10
			if par1 < par2
				res = 1
			else
				res = 0
			end
			if modes % 10 == 1
				int_code[i+3] = res
			else
				int_code[int_code[i+3]] = res
			end
			i += 4
		elsif int_code[i] % 10 == 8
			if modes % 10 == 1
				par1 = int_code[i+1]
			else
				par1 = int_code[int_code[i+1]]
			end
			modes = modes / 10
			if modes % 10 == 1
				par2 = int_code[i+2]
			else
				par2 = int_code[int_code[i+2]]
			end
			modes = modes / 10
			if par1 == par2
				res = 1
			else 
				res = 0
			end
			if modes % 10 == 1
				int_code[i+3] = res
			else
				int_code[int_code[i+3]] = res
			end
			i += 4
		elsif int_code[i] == 99
			break
		end
	end
end

# the input for the int computer 
int_code = [3,8,1001,8,10,8,105,1,0,0,21,30,47,60,81,102,183,264,345,426,99999,3,9,1002,9,5,9,4,9,99,3,9,1002,9,5,9,1001,9,4,9,1002,9,4,9,4,9,99,3,9,101,2,9,9,1002,9,4,9,4,9,99,3,9,1001,9,3,9,1002,9,2,9,101,5,9,9,1002,9,2,9,4,9,99,3,9,102,4,9,9,101,4,9,9,1002,9,3,9,101,2,9,9,4,9,99,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,99,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,101,1,9,9,4,9,99]

# for all possible permutations of the phasesetting
phase_setting_sequence = [5,6,7,8,9].permutation.to_a
maximum_output = 0

phase_setting_sequence.each do |phase_setting|
	int_codes = []
	(0..4).each do 
		int_codes.push int_code.dup
	end
	inputs = []
	phase_setting.each do |phase|
		inputs.push [phase]
	end
	inputs[0].push 0
	indexe = [0, 0, 0, 0, 0]
	cur_amp = 0

	while true
		input, current_index = run_int_code(int_codes[cur_amp], inputs[cur_amp], indexe[cur_amp])
		if input == nil
			maximum_output = [maximum_output, inputs[0][0]].max()
			break
		end
		indexe[cur_amp] = current_index
		cur_amp = (cur_amp + 1) % 5
		inputs[cur_amp].push input 
	end
end
p maximum_output
