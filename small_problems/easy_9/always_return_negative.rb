# # Always Return Negative


# **Rules/Requirements**

# Write a method that takes a number as an argument. If the argument is a 
# positive number, return the negative of that number. If the number is 0 or 
# negative, return the original number.

# *Input*: number
# *Output*: number

# *Explicit*: 
# - if argument is positive, return the negative of the number
#   If the number is 0 or negative, return the original number

# *Implicit*: 

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby
# ```

# **Data Structure**

# Initial: integer
# Intermediate: integer
# Return: integer

# **Algorithm**
# - If the given number is positive:
#   - return the result of subtracting 2 * the given number from itself
# else: 
#   return the given number as is

# **Code Implementation**

def negative(number)
  number.positive? ? (number - (number * 2)) : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
