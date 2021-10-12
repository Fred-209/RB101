# # Fibonacci Number Location By Length

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)



# **Rules/Requirements**

# *Input*: an integer
# *Output*: an integer

# *Explicit*: 
# - The argument will always be >= 2
# - Return the index of the first number in the fibonacci sequence who's number of digits are equal to the argument



# *Implicit*: 
# - The given integer argument will be the same as the character count of the digit we are trying to find the index of 


# **Examples/Test Cases**
# ```ruby
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
# ```

# **Data Structure**

# **Algorithm**

# - Set FIBONACCI equal to an array of [1, 1]
# - Keep adding numbers to the fibonacci sequence (using the fibonacci formula) until the last added number's length, when converted to a string, is equal to the given argument
# - Return the index of the last element in the fibonacci sequence array

def find_fibonacci_index_by_length(num)
  fibonacci = [1, 1]

  until fibonacci.last.to_s.length >= num
    fibonacci << fibonacci[-1] + fibonacci[-2]
  end

  fibonacci.index(fibonacci.last) + 1
end

p find_fibonacci_index_by_length(2)
p find_fibonacci_index_by_length(3)
p find_fibonacci_index_by_length(10)
p find_fibonacci_index_by_length(100)
p find_fibonacci_index_by_length(1000)
p find_fibonacci_index_by_length(10000)