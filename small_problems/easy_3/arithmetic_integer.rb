# Arithmetic Integer

# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

operators = %w(+ - * / % **)
print "Enter the first number: "
number_1 = gets.chomp.strip.to_i

number_2 = ''
loop do
  print "Enter the second number: "
  number_2 = gets.chomp.strip.to_i
  break if number_2.nonzero?
  puts "This number cannot be a zero"
  print "Please try again: "
end

operators.each do |operator|
  puts "#{number_1} #{operator} #{number_2} = #{number_1.send(operator,   number_2)}"
end

# puts "#{number_1} + #{number_2} = #{number_1 + number_2}"
# puts "#{number_1} - #{number_2} = #{number_1 - number_2}"
# puts "#{number_1} * #{number_2} = #{number_1 * number_2}"
# puts "#{number_1} / #{number_2} = #{number_1 / number_2}"
# puts "#{number_1} % #{number_2} = #{number_1 % number_2}"
# puts "#{number_1} ** #{number_2} = #{number_1 ** number_2}"

# 