# # Problem Description

# You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1

# **Rules/Requirements**

# *Input*: integer

# *Output*: integer


# *Explicit Requirements*: 
# - return -1 if no bigger number can be composed using the same digits
# - return the next biggest number from the given integer that can be 
# created using only the same digits from the givin intege

# *Implicit Requirements*: 
#  -


# *Questions:*
# - would a negative integer as input be a concern?
#  - will assume no as none of the test cases show a negative number as input

  
# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# p next_bigger_number(9) == -1
# p next_bigger_number(12) == 21
# p next_bigger_number(513) == 531
# p next_bigger_number(2017) == 2071
# p next_bigger_number(111) == -1
# p next_bigger_number(531) == -1
# p next_bigger_number(123456789) == 123456798
# ```

# **Data Structure**
# Initial: integer

# Intermediate:
# - maybe an array of integers or an array of string 'integers'

# Final: integer



# **Algorithm**

# *High level thought process / brainstorming ideas
# 2 approaches so far

# First apporach
# 1. Break the given integer down into an array of its individual digits
# 2. find every permutation of those digits
# 3. Check to see if any of those permutations, when combined into single integer, is greater than the given integer
# 4. return it if so, otherwise return -1



# *Lower level steps of implementation*
# - init `digits` to an array of digits created from the given integer
#   - could use `Integer#digits` for this, or convert the integer to a string and then split it, for an array of string integers
# - Use the `permutations` method on `digits` to get  MD array of subarrays whose elements are every possible permutation of the digits
#   - this returns an enumerator, convert to an array
# - transform each of the elements in this permuated array so that each element of the subarray is joined into a single integer(string) and then converted to an integer
# - return any element from this array if it's > than the given integer, otherwise return -1



# **Code Implementation**

def next_bigger_number(number)
  digits = number.to_s.chars
  permutations = digits.permutation.to_a
  
  permutations = permutations.map(&:join).map(&:to_i)
  if permutations.any? { |num| num > number } 
    permutations.keep_if { |num| num > number }
    permutations.min
  else
    -1
  end
end 

p next_bigger_number(9) == -1
p next_bigger_number(12) == 21
p next_bigger_number(513) == 531
p next_bigger_number(2017) == 2071
p next_bigger_number(111) == -1
p next_bigger_number(531) == -1
p next_bigger_number(123456789) == 123456798




# A more procedural approach: 

# *High Level/ Brainstorming* 
# - FInd every possible number that can be composed using the digits from 
# the given integer
# - convert integer into an array of digits
# - iterate over a range from the given integer to the highest possible number that can be formed from the digits of the integer
#   - to find the greatest possible number formed from the digits, 
#   I can sort the digits in descending order
# - Stop the range interation when a number is found in which every digit matches up with every digit from the given integer
#   -so if a sorted array of digits from the current integer iteration is equal to a sorted array of the given integer, then this is a permutation of the original number, and this should be th return value
#     - make sure this is the smallest number that is greater than the given integer
# - return -1 if the range iteration is complete and no number is found
  
    
def next_bigger_number_procedural(given_number)
  given_number_digits = given_number.digits.reverse
  largest_number_permutation_digits = given_number_digits.sort { |a,b| b <=> a }
  largest_number_permutation = largest_number_permutation_digits.map(&:to_s).join.to_i
  
  (given_number..largest_number_permutation).each do |num|
    if num.digits.sort == given_number_digits.sort
      return num if num > given_number
    end
  end
  -1
end
    
 p next_bigger_number_procedural(9) #== -1
p next_bigger_number_procedural(12) == 21
p next_bigger_number_procedural(513) == 531
p next_bigger_number_procedural(2017) == 2071
p next_bigger_number_procedural(111) == -1
p next_bigger_number_procedural(531) == -1
p next_bigger_number_procedural(123456789) == 123456798