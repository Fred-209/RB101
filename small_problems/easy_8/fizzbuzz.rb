# # fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two numbers,
# except if a number is divisible by 3, print "Fizz", if a number is divisible by
#  5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# **Rules/Requirements**

# *Input*: 2 numbers
# *Output*: a string

# *Explicit*:
# - print out all numbers between the two numbers given as arguments
# - if a number is divisible by 3, print out 'Fizz' instead
# - if  a number is divisible by 5, print out 'Buzz' instead
# - if a number is divisible by both 3 AND 5, print out 'FizzBuzz' instead

# *Implicit*:
# - The range of numbers to print out is inclusive of the starting and ending numbers
# - comma and a space should separate the numbers/words in the output string

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
# ```

# **Data Structure**
# Initial: 2 numbers

# Intermediate:
# Return: String

# **Algorithm**

# * Print to the screen each number between(inclusive) two given numbers.
# If a number is evenly divisible by 3 and 5 both, print 'FizBuzz' instead of the number.
# Divisible by 3, print 'Fizz', divisible by 5, print 'Buzz'*

# - create string var 'Fizz'
# - create string var 'Buzz'
# - create string var 'FizzBuzz'
# - create empty array 'numbers_and_fizzbuzz'
# - Check to see if both given numbers are divisible evenly by 3 AND 5
#   - If so, add 'FizzBuzz' to `numbers_and_fizzbuzz`
#   - else, convert the number to a string and add to 'numbers_and_fizzbuzz`'
# - Check to see if both numbers are evenly divisibl by 3:
#   - If so, add 'Fizz, ' to the above string
#   - else convert the number to  a string and add it to the above string
# - if both numbers are evenly divisible by 5
#   - add 'Buzz' to the above string
#   - else, convert the string to a number and add it to the above string

# **Code Implementation**

def evenly_divisible_by_all_divisors?(number, *divisors)
  divisors.all? { |divisor| number % divisor == 0 }
end

def fizzbuzz(start_num, end_num)
  fizz = 'Fizz'
  buzz = 'Buzz'
  fizzbuzz = 'FizzBuzz'

  numbers_and_fizzbuzz =
    (start_num..end_num).to_a.map do |number|
      if evenly_divisible_by_all_divisors?(number, 3, 5)
        fizzbuzz
      elsif evenly_divisible_by_all_divisors?(number, 3)
        fizz
      elsif evenly_divisible_by_all_divisors?(number, 5)
        buzz
      else
        number.to_s
      end
    end

  numbers_and_fizzbuzz.join(', ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
