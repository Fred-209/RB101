# # Counting Up


# **Rules/Requirements**
# Write a method that takes an integer argument, and returns an Array of all 
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater 
# than 0.

# *Input*: an integer
# *Output*: array of integers

# *Explicit*: 
# - The argument will always be a valid integer > 0
# - The return array of integers should be in sequence , starting with 1

# *Implicit*: 
# - The first number in the return array will always be one
# - If 1 is given as the argument, return 1, so it's inclusive

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]
# ```

# **Data Structure**

# Initial: integer
# Intermediate: array
# Return: array

# **Algorithm**
# * Return an array of integers starting at 1 and going upto the given argument*
# - create an empty array , `int_array`
# - Iterate from the number 1 through the given integer
#   - add the current iteration number to the array created in step 1
# - Return `int_array`


# **Code Implementation**

def sequence(last_number)
  int_array = []

  (1..last_number).each do |number|
    int_array << number
  end
  int_array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

#one liner

def sequence(last_number)
  (1..last_number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]