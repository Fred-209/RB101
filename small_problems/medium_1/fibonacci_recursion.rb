
# UWrite a recursive method that computes the nth Fibonacci number, where nth is 
# an argument to the method.

# **Rules/Requirements**

# *Input*: integer

# *Output*: integer


# *Explicit Requirements*: 
# - must use recursion in the method for this calculation
# - Find the nth number of the fibonacci sequence, where 'n' is the given integer

# *Implicit Requirements*: 
#  - the count of the number, if looking at an array of fibonacci numbers, would be 
#  the index value + 1 of that number
# - The fibonacci sequences starts with 1, 1, and then each number after that 
# is the result of the previous 2 numbers combined
# - the fibonacci math formula is F(n) = F(n - 1) + F(n - 2) where n > 2
# *Questions:*

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765
# ```

# **Data Structure**
# Initial: integer

# Intermediate: a recursive expression 

# Final: integer



# **Algorithm**


# *High level thought process / brainstorming ideas
# - Write a recursive method, using the fibonacci algorithm (equation) as a guide
# - If the given number is <= 2, return 1 (the first 2 numbers are both 1)
# - If given number is greater than 2:
#   - use formula f(n-1) + f(n-2) to have the method call itself recursively
#   - This works because the 'n' fibonacci number is the sum of the previous 2 
#     numbers in the sequence, represtend as (n-1) and (n-2)


# *Lower level steps of implementation*
# - given integer 'number`
# - if given integer <= 2:
#   - return 1
# - else
#   - call 'fibonacci' again, passing in (`number` - 1) 
#     - add this to the result of `fibonacci(`number` - 2)
#     - the above two should be on one line, one expression

# **Code Implementation**

def fibonacci(number)
  if number <= 2
    1
  else
    fibonacci(number-1) + fibonacci(number - 2)
  end
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765