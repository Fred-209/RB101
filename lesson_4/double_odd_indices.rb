def double_odd_indicies(numbers)
  counter = 0
    
  loop do
    break if counter == numbers.size
    numbers[counter] *= 2 if counter.odd?
    counter += 1 
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6] 

p double_odd_indicies(my_numbers) == [1, 8, 3, 14, 2, 12]