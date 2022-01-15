
# *Input*: string
# *Output*: integer
# (length of longest palindrome substring)

# *Requirements*
# - find the length of the longest substring in the given string that reads the same in reverse as it does forwards
# - if the length of the input string is 0, return value must be 0

# *Inferred from description/ test cases*
# - if substring is a single char in length, return 1 because single char is same forwards as backwards
# - as long as string has a single char, the minimum return integer would be 1

# *Questions*
# - What if there is more than one substring that has the same long length of characters? Return the earliest found?
#   - won't matter since what's being returned is a count of the characters, not the characters themselves

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby
# p longest_palindrome("a") == 1
# p longest_palindrome("aa") == 2
# p longest_palindrome("baa") == 2
# p longest_palindrome("aab") == 2
# p longest_palindrome("baabcd") == 4
# p longest_palindrome("baablkj12345432133d") == 9
#  ```

# **Data Structure**
# string => 2d array of substrings => integer

# **Algorithm**

# *High level thought process / brainstorming ideas
# - find all possible consecutive substrings from the given string
# - select from the array of substrings only those substrings which read the same forwards as backwards
# - find the longest length subarray that meets this criteria, and return the count of its characters
# - use helper method to get_all_substrings
# - Use selection method on substrings array to select for only those substrings that when reversed, return true when compared for equality against the forward reading string
# - Use selection again to choose that substring (or substrings) that have the longest length of characters
# - find the length of this string, and return this integer count of chars



# *Lower level steps of implementation*
# - init `substrings` to the result of calling get_all_substrings(given_string)
# - init `palindromes` to result of:
# - Iterate over `substrings` using `select` , `substring` is parameter
#   - select for those `substring` that when compared for equality with their `reverse` version return truthy
# - Use selection on `palindromes` to select the string that has the longest length, then chain the `length` method on this string to get its char count, and return this

  
# *get_all_substrings*
# input: string
# output: array of strings
# - init empty variable `substrings` to store substrings as they are found
# - Iterate over a range of from 0 through the length of the given string, exclusive ( or subtract 1 from length), `start_idx`
#   - create inner loop to iterate over range from `start_idx` through the length of the string again, exclusive `end_idx`
#     - For each inner iteration, append the substring found at given_string[start_idx through end_idx] (inclusive), to the `substrings` array
# - return `substrings` array

    
# **Code Implementation**

def longest_palindrome(string)
  substrings = get_all_substrings(string)
  palindromes = substrings.select { |substring| substring == substring.reverse }
  palindromes.max_by(&:length).length
  
end


def get_all_substrings(string)
  substrings = []
  
  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      substrings << string[start_idx..end_idx]
    end  
  end
  substrings
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
      
    
