# # Multiply Lists

# Write a method that takes two Array arguments in which each Array contains a list 
# of numbers, and returns a new Array that contains the product of each pair of numbers
#  from the arguments that have the same index. You may assume that the arguments contain
#   the same number of elements.


# **Rules/Requirements**

# *Input*: 2 arrays of numbers
# *Output*: 1 array

# *Explicit*: 
# - both arguments will have the same number of elements
# - Multiply pairs of integers, paired by those who have the same 
#   index value in each of the two given arrays
# - Return a *new* array

# *Implicit*: 
# - The order in the returned array needs to be kept the same as the given 2
# - The numbers will all be integers based on the test cases

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# ```

# **Data Structure**
# Initial: 2 arrays
# Intermediate: array
# Final: array

# **Algorithm**

# *Multiply each pair of numbers from the given array, where pair means they both 
# share the same index value. These multiplied answers should be returned in a new single array
# that keeps the same number order as the given 2*

# - Create empty array
# - Traverse array 1, with index value
#   - multiply the current element by the element from array_2 at the index of this element
#   - Add this answer to the new empty array
# - Return the new array

# **Code Implementation**

# def multiply_list(array_1, array_2)
#   multiplied_array = []
#   array_1.each_with_index do |number, idx|
#     multiplied_array << number * array_2[idx]
#   end
#   multiplied_array
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# #Using Arary#zip

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |sub_array| sub_array.reduce(:*)}
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

