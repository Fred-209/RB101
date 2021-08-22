# Practice Problem 11

# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

# Using #select
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

temp = arr.map do |sub_array|
         sub_array.select { |number| number % 3 == 0}
end

p temp

# Using #reject

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

temp = arr.map do |sub_array|
         sub_array.reject { |number| number % 3 != 0}
end

p temp