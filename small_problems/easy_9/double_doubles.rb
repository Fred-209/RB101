# # Double Doubles

# A double number is a number with an even number of digits whose left-side digits
#  are exactly the same as its right-side digits. For example, 44, 3333, 103103, 
#  7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless 
# the argument is a double number; double numbers should be returned as-is.

# **Rules/Requirements**

# *Input*: integer
# *Output*:integer

# *Explicit*: 
# - a double number is one defined as whose left side digits match the right side
#   - 112112 , 334334, etc
# - double numbers have an even number of digits
# - return 2x the given number if the number is NOT a given number

# *Implicit*: 
# - All test cases show the given number will be of even lengthj

# *Questions:*
# - return an empty string when given one?
# - How to handle a given number of odd length?


# **Examples/Test Cases**

# ```ruby
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# ```

# **Data Structure**

# Initial: integer
# Intermediate: string -> array of chracters
# Return: intege

# **Algorithm**
# *Divide the array up in to two halves - The given number should be even*
# - Convert the given integer into a string
# - The midpoint of the string should be (string length / 2) - 1
# - Set 'first half' variable equal to a substring of 0 through the midpoint, noninclusive)
# - set 'second half' = to a substring from midpoint through the end of the string, inclusive
# - If first half is equal to second half, the given number is a double
# - Return the number given if the given number is a double, return the number * 2 
# if the given number is NOT a double

# **Code Implementation**

# def twice(number)
#   number_str = number.to_s
#   midpoint = number_str.length / 2
#   first_half = number_str[0...midpoint]
#   second_half = number_str[midpoint..-1]

#   first_half == second_half ? number : number * 2
# end


# One Liner
# def twice(number)
#   number.to_s[0...(number.to_s.length / 2)] == number.to_s[(number.to_s.length / 2)..-1] ? number : number * 2
# end

def double?(num)
  num = num.to_s
  if num.size.even?
    # p num
    # p num.slice!(0, (num.size / 2))
    p num == num.slice!(0, (num.size / 2))
    true if num == num.slice!(0, (num.size / 2))
  end
end

def twice(num)
  double?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
