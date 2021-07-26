# Searching 101

# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

number_list = []
user_number = ''
ordinals = %w(1st 2nd 3rd 4th 5th last)

6.times do |num|
  loop do
    print "Enter the #{ordinals[num]} integer: "
    user_number  = gets.chomp.strip
    break if Integer(user_number, exception: false) != nil
    puts "That's not an integer. Please try again."
  end

  number_list << user_number.to_i if (num + 1) < 6
end

if number_list.include?(user_number.to_i)
  puts "The number #{user_number} does appear in #{number_list}."
else
  puts "The number #{user_number} does not appear in #{number_list}."
end







  