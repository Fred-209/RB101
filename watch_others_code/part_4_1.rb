
# *Input*: 2 strings
# *Output*: boolean (true or false)

# *Requirements*
# - return true if there is a substring that appears in both strings
#   - otherwise return false
# - only substrings that are longer than one letter in length count as a common substring

# *Inferred from description/ test cases*
# - if any given string is empty, return false
# - casing is NOT important
#   - 'b' is not equal to 'B" when comparing characters for substrings
# - if the only substring found in common between the two strings is one char long, then return false

# *Questions*

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby
#  p substring_test('Something', 'Fun') == false
#  p substring_test('Something', 'Home') == true
#  p substring_test('Something', 'Fun') == false
#  p substring_test('Something', '') == false
#  p substring_test('', 'Something') == false
#  p substring_test('BANANA', 'banana') == true
#  p substring_test('test', 'lllt') == false
#  p substring_test('', '') == false
#  p substring_test('1234567', '541265') == true
#  p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
# ```

# **Data Structure**
# strings => arrays of characters, strings => boolean

# **Algorithm**

# *High level thought process / brainstorming ideas
# - have guard clause to return false if any of the string inputs are empty
# - If two or more more characters from the 2 given strings are the same char, then a common substring is possible, and therefore true
# - init a variable `common_char_count` to 0, and incremement this if a character is found to be common to both strings
# - Iterate over the chars in in string, testing each char to see if its contained in the second strin, and doing incrememening common_char_count if it is
# # - return true if common_char_count > 1, false otherwise
# - duplicates do matter
#   - if one string contains the same character more than once, and the other strin only contains it once, this only counts as one matching character
  

# *Lower level steps of implementation*
# 1. return false if either string is empty?
# 2. init `common_char_count` to 0
# 3. Iterate over the chars (downcased, duplicates removed) in the first given string:
#   - if second given string (downcased, duplicates removed) includes this char
#     - incremement `common_char_count` by 1
#   - end
# 4. Return true if `common_char_count` > 1





# **Code Implementation**

def substring_test(string_1, string_2)
  return false if string_1.empty? || string_2.empty?
  
  common_char_count = 0
  string_1.downcase.chars.uniq.each do |char|
    common_char_count += 1 if string_2.downcase.chars.uniq.include?(char)
  end
  common_char_count > 1
end




p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true