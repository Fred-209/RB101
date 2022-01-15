
# *Input*: array of strings
# *Output*: string
# - common prefix substring


# *Requirements*
  
# - return the longest prefix string found that is common among all given string in the given array of strings
# - if no common prefix string is found, return 0
# - all given chars in the array of strings are lowercase letters


# *Inferred from description/ test cases*

# *Questions*

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby
# p common_prefix(%w[flower flow flight])
# p common_prefix(%w[dog racecar car])
# p common_prefix(%w[interspecies interstellar interstate])
# p common_prefix(%w[throne dungeon])
# p common_prefix(%w[throne throne])
# ```

# **Data Structure**
# array of strings => empty string to build upon => string
# - iterating over arrays of characters from given strings

# **Algorithm**

# *High level thought process / brainstorming ideas
# - If all strings don't have the same first char, then there can be nocommon prefix string
# - Create an empty string to build upon
# - Iterate over the chars in the first string from the given array, with index
#   - if the current character is the same character found in the same index position for evey other subarray, then append this character to the empty builder string
#   - if it's not the same, break out of iteration, or could return the string that has been being built up
# - return builder string `common_prefix`


# *Lower level steps of implementation*
# 1. init `common_prefix` to an empty string
# 2.  Iterate over the chars found from the string at index 0 (first) from given array of strings, with index |char, idx|
#   - If all the strings in given array have this char at this index position, append char to `common_prefix`
#   - (could use the all? enumerable method, to iterate over the given array of strings, checking to see if the char at the current idx posiiton is the same as the current `char`)
# 3. return `common_prefix`



# **Code Implementation**

def common_prefix(string_array)
  common_prefix = ''
  
  string_array.first.chars.each_with_index do |char, idx|
    if string_array.all? { |string| string[idx] == char }
      common_prefix << char
    else
      break
    end
  end
  return common_prefix
end
  

p common_prefix(%w[flower flow fliwht])
p common_prefix(%w[dog racecar car])
p common_prefix(%w[interspecies interstellar interstate])
p common_prefix(%w[throne dungeon])
p common_prefix(%w[throne throne])