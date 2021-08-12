# #Multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# **Rules/Requirements**

# *Input*: Integer > 1
# *Output* Integer

# *Explicit*: 
# - returned integer will be greater than 1
# - Need to add up the sum of all numbers between 1 and given integer that 
#   are either a multiple of 3 or a multiple of 5

# *Implicit*: 
# - The range of numbers to look in for factors of 3, 5 should include the given integer


# **Examples/Test Cases**

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# **Data Structure**

# 8 -> [3, 5, 6] -> 14

# **Algorithm**

# - create an empty array `multiples_3_5`
# - Loop over a range of numbers starting with 1 and ending with the given integer, inclusive
#   - If the current number in the loop is either a multiple of 3 or a multiple of 5, add it to the `multiples_3_5` array
# - Calculate the sum of all the numbers in the `multiples_3_5` array
# - Return this sum

def multisum(number)
  multiples_3_5 = []

  (1..number).each do |num|
    multiples_3_5 << num if num % 3 == 0 || num % 5 == 0
  end

  multiples_3_5.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
  





