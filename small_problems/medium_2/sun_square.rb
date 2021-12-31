# # Sum Square - Square Sum

# Write a method that computes the difference between the square of the sum of the
#  first n positive integers and the sum of the squares of the first n positive 
#  integers.

# **Rules/Requirements**

# *Input*: integer
# *Output*: integer

# *Explicit*: 
# - sum the first `n` positive numbers, square them
# - square each positive number up to `n`, sum them
# - subtract the square sum (2nd above) from the sum square (1st listed above


# *Implicit*: 
# - The given number will always be greater than 0 based on test cases

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
# ```

# **Data Structure**

# Initial: integer
# Intermediate: range, array
# Return: integer

# **Algorithm**

# *Calculate the sum of all positive numbers through the given integer, then square 
# this sum. For each number in the range of positive numbers up to the given integer, 
# square each one and add them together.
# Subtract the 'square sum' from the 'sum square'*

# - Add up all the numbers from 1 through the given integer, then square this result. `sum_square`
# - In a range from 1 through the given integer, square each number then sum them all together, `square_sum`
# - return the result of subtracting `square_sum` from `sum_square`

# **Code Implementation**

def sum_square_difference(num)
  sum_square = (1..num).sum ** 2
  square_sum = (1..num).reduce { |memo, current_num| memo + current_num ** 2 }
  sum_square - square_sum
end

p sum_square_difference(3)
