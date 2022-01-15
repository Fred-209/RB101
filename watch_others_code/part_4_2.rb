
# *Input*: 2 strings
# *Output*: boolean

# *Requirements*
  
# - return true if a portion of string 1 can be rearranged to match str 2
#   - return false otherwise
# - only lowercase letters will be used
# - no punctuation or digits will be included

# *Inferred from description/ test cases*
# - string lengths dont need to match to find a matching portion from string 1 that contains the letters in string 2

# *Questions*

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby
# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript' == true
# p scramble('scriptingjava', 'javascript' ) == true
# ```

# **Data Structure**
# - 2 strings => array of lowercase letters => boolean

# **Algorithm**

# *High level thought process / brainstorming ideas
# - string 1 will have to contain all the same letters as string 2
#   - including duplicates
# - For each letter in string 2, string 1 shoud contain the same count or greater of that letter
# - If this is true for every char in string 2, then the conditions are met and should return true, false otherwise

# - Iterate over the chars in string 2
#   - if the count of this char in string 1, is greater than or equal to the count of this char in string 2, then this means that that the are enough matching chars between the two strings (for this char) to satisfy the match conditions
#   - If there is a iteration where the above does not hold true, method should return false because this means that there is not enough matching chars in str 1 to form str2 when rearranging
#   - go onto next iteration if str 1 count of char is greater than or equal str2 count of char, 
#   - 
# *Lower level steps of implementation*
# - Iterate over the chars in string 2:
#   - init char_1 count to the result of calling `count` on string 1 with the current char passed in as an argument
#   - init char_2 ......string 2
#   - return false if char_1_count < char_2_count
# - return true (implicit if code reaches this point in method definition)


# **Code Implementation**

def scramble(string_1, string_2)
  string_2.each_char do |char|
    string_1_char_count = string_1.count(char)
    string_2_char_count = string_2.count(char)
    return false if string_1_char_count < string_2_char_count
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true