# # Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are 
# palindromic. That is, each substring must consist of the same sequence of 
# characters forwards as it does backwards. The return value should be arranged in
#  the same sequence as the substrings appear in the string. Duplicate palindromes
#   should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay
#  attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
#   "Abc-bA" are. In addition, assume that single characters are not palindromes.


# **Rules/Requirements**

# *Input*: a string
# *Output*: an array of strings

# *Explicit*: 
# - return an array of all palindromes from all possible substrings of the given string
# - a palindrome is a word/characters that read the same forwards as they do backwards
# - the return array should have the string elements arranged in the same order as 
#   the substrings would be
# - Duplicate palindromes should be included multiple times
# - use the 'substrings' method from the previous exercise
# - Case sensitive palindromes
# - single characters are not palindromes


# *Implicit*: 

# *Questions:*
# - What do blank spaces count as? towards a palindrome?
# **Examples/Test Cases**

# ```ruby
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
# ```

# **Data Structure**
# Initial: strings
# Intermediate: Arrays
# Final: Array

# **Algorithm**
#   - create empty array 'palindrome_list'
# - Get list of all substrings by using the previous 2 methods from previous 2 exercises
# - Iterate over each substring
#   - skip to next iteration if current element has a length of less than 2
#   - If any substring in 'substrings' is equal to the reverse of the current element,
#     add it to palindrome_list
#   return 'paindrome_list'



# **Code Implementation**

def leading_substrings(str)
  substring_array = []
  alphanumeric_string = str.gsub(/[^a-z0-9]/i, " ")
  str.length.times do |idx|
    
    substring_array << alphanumeric_string[0..idx]
  end
  substring_array
end

def substrings(str)
  substrings = []

  str.each_char.with_index do |char, position|
    substrings << leading_substrings(str[position..-1])
  end
  substrings.flatten
end

def palindromes(str)
  palindrome_list = []
  substring_list = substrings(str)

  substring_list.each do |sub_string|
    next if sub_string.length < 2
    palindrome_list << sub_string if sub_string.downcase == sub_string.reverse.downcase
  end
  palindrome_list
end

p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
  # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  # '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration: 
# Modify your methods to ignore non-alphanumeric characters and case
# - I'm going to assume that 'ignore' in this instance means just for the palindrome
# criteria, not for substring criteria.
# - Delete all non-alphanumeric characters from the given string in the 
# `leading_substrings` before every creating an array of substrings
# - In the `palindromes` method, downcase both operands when checking for equality

