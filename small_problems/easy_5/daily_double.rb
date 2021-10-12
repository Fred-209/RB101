# # Daily Double

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a new string, modified version of the input string

# *Explicit*: 
# - Do not use String#squeeze or String#squeeze!
# - All consecutive duplicate characters should be collapsed into a single character

# *Implicit*: 

# - an empty string should return an empty string
# - An input string containing just a single character should return that single character

# **Examples/Test Cases**
# ```ruby
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
# ```

# **Data Structure**

# **Algorithm**

# - Create empty string `crunched_str`
# - Assign `str_arr` to an array made of of the individual characters from the given string
# - Iterate over `str_arr`
#   - If the last element of `crunched_str` is not equal to the current element, add this current element to the end of `crunched_str`
# - Return `crunched_str`

def crunch(str)
  crunched_str = ''
  str_arr = str.chars

  str_arr.each { |letter| crunched_str << letter unless letter == crunched_str  [-1]}

  crunched_str
end

# Using Regex
 
def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
