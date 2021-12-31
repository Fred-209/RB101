# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

# **Rules/Requirements**

# *Input*: integer

# *Output*: integer


# *Explicit Requirements*: 
# - return the last digit of a number found in the fibonacci sequence at position `n` 
#   where `n` is a given argument (integer)

# *Implicit Requirements*: 
#  - 


# *Questions:*

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4
# ```

# **Data Structure**
# Initial: integer

# Intermediate: array(fibonacci sequence)

# Final: integer



# **Algorithm**

# *High level thought process / brainstorming ideas

# - use the procedural fibonacci method from the last exercise to find the number in the
#   fibonacci sequence for a given integer
# - return the digit in the ones place for this number found above (can use number % 10 for this)

# *Lower level steps of implementation*
# - copy over the `fibonacci` method from previous exercise
# - assign `fibonacci_number` to the result of calling `fibonacci` with the given integer `number` passed in as an argument.
# - return the result of `fibonacci_number` mod 10


# **Code Implementation**
    

def fibonacci(number)
  return 1 if number <= 2
  
  fib_sequence = [1, 1]
  until fib_sequence.count == number
    fib_sequence << fib_sequence[-1] + fib_sequence[-2]
  end
  fib_sequence[-1]
end


def fibonacci_last(number)
  fibonacci_number = fibonacci(number)
  fibonacci_number % 10
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
  

