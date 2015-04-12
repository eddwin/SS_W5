module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    checksum = nums_a.pop
    nums_a.reverse!
    results = nums_a.map.with_index do |n,i|
      i.even? ? n*2 : n*1
    end
    single = results.to_s.chars.map(&:to_i)
    luhn = single.inject(:+) + checksum
    luhn%10==0? true : false
  end

  def validate_checksum2
	#pass number to characters with the map function
	nums_a = number.to_s.chars.map(&:to_i)

	#Get the last digit to make the last comparison with check digit
	last_digit = nums_a.pop

	#variable to store the sum of the numbers
	total =0

	#Reverse the array to start counting from the one at the right
	nums_a.reverse!

	#Create and array with all the numbers that are even
	evens= nums_a.values_at(* nums_a.each_index.select {|i| i.even?})

	#Create and array with all the numbers that are odd
	odds = nums_a.values_at(* nums_a.each_index.select {|i| i.odd?})

	#Add all the numbers within the array
	odds.each{|num| total +=num}

	#define a function for doubling the numbers and divide them and return total
	def suma(num)
		total =0
		((num*2).to_s.chars.map(&:to_i)).each{|x| total+=x}
		return total
	end

	#MUltiply the even index values by 2
	total_evens = 0
	evens.each{|num| total_evens += suma(num)}
	total+=total_evens

	#FInding the check digit
	check_digit = (total*9)%10
	if last_digit ==check_digit
		return true
	else
		return false
	end

end
def validate_checksum3
  nums_a = number.to_s.chars.map(&:to_i)
  checksum = nums_a.pop
  nums_a.reverse!
  evens= nums_a.values_at(* nums_a.each_index.select {|i| i.even?})
	odds = nums_a.values_at(* nums_a.each_index.select {|i| i.odd?})
  luhn = odds.inject(:+)
  evens_result = evens.map {|x| x*2}
  luhn += evens_result.inject(:+)
  single = evens_result.to_s.chars.map(&:to_i)
  luhn += single.inject(:+) + checksum
  luhn%10==0? true : false
end
 def validate_checksum3
   nums_a = number.to_s.chars.map(&:to_i)

    total_sum = 0
    double_digit = []

    a_rev = nums_a.reverse!
    a_rev.delete_at(0)

    a_rev.map!.with_index(0){ |x, index| if index % 2 == 0
                        2*x
                    else
                        1*x end}

    a_rev.each { |x|
        if x > 9
          double_digit = x.to_s.chars.each_slice(1).map{|a| a.join.to_i}
          total_sum = total_sum + double_digit[0] + double_digit[1]
        else
          total_sum = total_sum + x
        end
        }
    print total_sum
    if total_sum % 10 == 0
      return true
    else
      return false
 end


end
