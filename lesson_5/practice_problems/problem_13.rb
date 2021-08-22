# Practice Problem 13

Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

- Need to sort by only the number at index 2, as all the numbers in index 0 are 1, and all the numbers of each sub_array in position index 1 are even numbers.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by { |sub_array| sub_array[2]}

# Alternate version using Array#select
# This solution works better because it is broader, will work on more than just 
# the given test case. 

arr.sort_by do |sub_array|
  sub_array.select do |number|
    number.odd?
  end
end

