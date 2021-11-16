# # Leading Substrings

# Write a method that returns a list of all substrings of a string that start at 
# the beginning of the original string. The return value should be arranged in 
# order from shortest to longest substring.

# **Rules/Requirements**

# *Input*: a string
# *Output*: an array of strings

# *Explicit*: 
# - return an array of substrings that start from the beginning of the given string
# - The return array should be sorted in order from shortest to longest string
# - 

# *Implicit*: 
# - the given string will be at least one char long
# - The final string in the return array will be the same as the given string
# - The length of the given string will be the same as the length of the return array


# *Questions:*

# **Examples/Test Cases**

# ```ruby
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# ```

# **Data Structure**
# Initial: string
# Intermedite: array
# Final: Array
# 'xyzzy' -> 'x' , 'xy', 'xyz', 'xyzz', 'xyzzz'
# **Algorithm**

# - Create an empty array
# - Iterate over the given string
#   - add the substring from 0 to the index of the current iteration




# **Code Implementation**

# def leading_substrings(str)
#   substring_array = []
  
#   str.length.times do |_|
#     substring_array << str.clone
#     substring_array
#     str.chop!
#   end
#   substring_array.reverse
# end

# p leading_substrings('xyzzy')
# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']

#Using .upto

def leading_substrings(str)
  substring_array = []
  str.length.times do |idx|
    substring_array << str[0..idx]
  end
  substring_array
end

leading_substrings('xyzzy')
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']