def multiply(my_numbers, multiplier)
  counter = 0
  multiplied_numbers = []

  
  loop do
    break if counter == my_numbers.size
    
    current_number = my_numbers[counter]
    multiplied_numbers << current_number * multiplier
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]