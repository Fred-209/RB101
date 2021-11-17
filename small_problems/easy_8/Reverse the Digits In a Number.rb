# # Reverse the Digits In a Number

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

# **Rules/Requirements**

# *Input*: integer
# *Output*: integer

# *Explicit*: 
# - reverse the digits in the given integer and return them

# *Implicit*: 
# - Don't worry about leading zeros
# - A single digit integer as the given argument should just be returned as is
# *Questions:*

# **Examples/Test Cases**

# ```ruby
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
# ```

# **Data Structure**

# Initial: integer
# Intermediate: array
# Return: integer

# **Algorithm**

# *Reverse the digits in a given integer and return this*
# - 'integer'.digits.join.to_i is a one liner
# - 'integer'.to_s.reverse.to_i is another one liner
# - *Procedural way* -without converting to a string first
#   - create an empty array to store the digits
#   - start a loop that breaks when 'number' is equal to the remainder of dividing number 
#     by 10
#     - set number and digit equal to the division and remainder of dividing 10 into number, respectively
#     - add 'digit' to 'digits' array
#   - assign accumulator to 0
#   - start a for loop to iterate over the digits array
#     - reassign 'accumulator' to be equal to multiplying itself by current number
#     - reassign accumulator to be equal to itself + number
#   - return accumulator

# **Code Implementation**

def reversed_number(number)
  digits = []
  accumulator = 0

  until number.divmod(10).sum == 0 
    number, digit = number.divmod(10)
    digits << digit
  end

  for num in digits 
    accumulator *= 10
    accumulator += num
  end

  accumulator
end

p reversed_number(12345) #== 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1


# converting to string, reverse, back to integer
def reversed_number(number)
  number.to_s.reverse.to_i
end

# convert to array of digits (reverse ordered), join as a string, convert to integer
def reversed_number(number)
  number.digits.join.to_i
end