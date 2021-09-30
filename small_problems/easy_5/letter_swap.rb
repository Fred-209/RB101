# # Letter Swap

# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# **Rules/Requirements**

# *Input*: a string containing words and spaces
# *Output*: a modified version of the given string 

# *Explicit*: 
# - Every word will contain at least one letter
# - There will be only letters and spaces in the string
# - Every string will contain at least one word


# *Implicit*: 
# - letter casing needs to be maintained based on the test cases
# - There will be no punctuation to code for 


# **Examples/Test Cases**
# ```ruby
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'
# ```

# **Data Structure**

# **Algorithm**

# - Split up the given string into an array of the words as the array elements, `str_array`
# - Iterate over `str_array` using transformation in a block
#   - set `first_letter` equal to the first character in the current string element
#   - set the first character in the current element equal to the last letter (index of -1) of the current element
#   - set the last letter of the current element equal to 'first_letter'
# - Join the transformed 'str_array' together with the elements separated by whitespace
# - Return this joined `str_array`

# def swap(str)
#   str_array = str.split
#   str_array.map do |word|
#     first_letter = word.chr
#     word[0] = word[-1]
#     word[-1] = first_letter
#   end
  
#   str_array.join(' ')
# end

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
