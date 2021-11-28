# # Sequence Count

# Create a method that takes two integers as arguments. The first argument is a 
# count, and the second is the first number of a sequence that your method will 
# create. The method should return an Array that contains the same number of 
# elements as the count argument, while the values of each element will be
#  multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater,
#  while the starting number can be any integer value. If the count is 0, an empty
#    list should be returned.


# **Rules/Requirements**

# *Input*: 2 integers
# *Output*: an array

# *Explicit*: 
# - The first argument is the count of elements in the return array
# - The second given argument is the starting number to find multiples of
# - If the given count (first argument) is zero, return an empty aray


# *Implicit*: 
# - The first element in the return array will always be the given starting integer
# (second given argument)
# - Each number in the return array should be the given start number multipled by 
# its position in the array (not index value)
#   - Example: given starting number of 7;
#     - first number would be 7 (7 * 1)
#     - second number would be 14 (7 * 2)
#     - third number would be 21 (7 * 3)...etc
# - The length of the return array will be the same number of multiplication operations
# performed


# *Questions:*

# **Examples/Test Cases**

# ```ruby
# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []
# ```

# **Data Structure**

# Initial: integers
# Intermediate: array
# Return: array

# **Algorithm**
# - create an array that has numbers in a range from 1 to the first given argument,
# count
# - Iterate over this array using transformation:
#   - return the result of multiplying second argument by current iteration element
# - return this transformed array

# **Code Implementation**

def sequence(count, first_number)
  (1..count).map { |multiplier| first_number * multiplier}
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []