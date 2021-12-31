# Write a Fibonacci method to find the nth number where 'n' is a given integer
# Do not use recursion

# **Rules/Requirements**

# *Input*: integer

# *Output*: integer (fibonacci number found in sequence at given integer's count)



# *Explicit Requirements*: 
# - do not use recursion for this

# *Implicit Requirements*: 
#  - The `nth` fibonacci number is the number found in the sequence of 
#  fibonacci numbers at position `n`, or the final number in  a count of all of them
#  - if the fibonacci sequence is represented as an array of integers, then the nth number should 
#  be the number found at the index value + 1
 


# *Questions:*

# *Edge Cases*:
# - if given 0, 1, or 2 as the given number, return `1`


# **Examples/Test Cases**
# ```ruby
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501
# ```

# **Data Structure**
# Initial: integer

# Intermediate: array to represent fibonacci sequence of numbers

# Final: integer



# **Algorithm**

# *High level thought process / brainstorming ideas
# - If creating an array of numbers to represent the fibonacci sequence with `n` total
# elements in it, the `nth` number would be the one found at index -1
# - First build the fibonacci sequence, an array of integers
#   - the first 2 are always `1`
#     - fibonacci array could start off at [1, 1]
#   - after that, the last number in the array should be the result of the previous 2 numbers added
#   together
#   - last_num = (last_num) - 1 + (last_num - 2)
#   - if building an array, these numbers could be referenced with index -1 and index of -2
#   - If number <= 2, return 1 because the first 2 numbers are 1 in the fibonacci sequence
#   - else: 
#     - build up a sequence of fibonacci numbers starting with fibonacci = [1, 1] and appending the result fibonacci[-1] + fibonacci[-2] to the end of this fibonacci array
#   - this should be loop that stops when the count of elements in the fibonacci array is equal to 
#   the given integer
#   - return the element found at position 1 of the fibonacci array
    


# *Lower level steps of implementation*
# `number` is the given integer

# - if `number` <= 2
#   - return 1
# - else
#   - init `fib_sequence` to an array of [1, 1]
#   - until the count of `fib_sequence` is equal to `number`
#     - calculate the sum of `fib_sequence[-1] + fib_sequence[-2]` and append this to 
#     `fib_sequence`
#   - return `fib_sequence[-1]`
  

# **Code Implementation**

def fibonacci(number)
  return 1 if number <= 2
  
  fib_sequence = [1, 1]
  until fib_sequence.count == number
    fib_sequence << fib_sequence[-1] + fib_sequence[-2]
  end
  fib_sequence[-1]
end




p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
