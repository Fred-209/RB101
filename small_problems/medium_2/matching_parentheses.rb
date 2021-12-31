# solved on 12/28 in 26 min


# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# **Rules/Requirements**

# *Input*: string

# *Output*: boolean


# *Explicit Requirements*: 
# -return true if all parentheses are properly balanced
# - properly balanced means that there are matchin g'(' and ')' pairs
# -  matching pair must start with '(' not ')'

# *Implicit Requirements*: 
#  - the first parentheses in the string must be an open one, otherwise 
# it is already disqualified as a possible balanced pair



# *Questions:*

# *Edge Cases*:
# - empty string should return `false`
# - string with no parentheses should return false



# **Examples/Test Cases**
# ```ruby
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# ```

# **Data Structure**
# Initial: string

# Intermediate: maybe an array of character, maybe only work on the initial string

# Final: boolean



# **Algorithm**

# *High level thought process / brainstorming ideas
# - if the count of parentheses in the string are an odd number, return `false`
# - if the first parentheses in the strings is a closed one, return `false`
# - delete all characters from the string that are not '()'
# - when moving from left to right across the string, the count of closed parentheses should never exceed 
# the count of open ones
# - count open and closed paraentheses as iteration occurs, and if closed parentheses ever exceeds the amount of open ones, then return false
#   - 
# *Lower level steps of implementation*

# - init a variable `parens` that is equal to the given string after deleting all non-parentheses chars from it
# - return false if the length of `parens` is odd or if the first char in parens is ')'
# - init variables `open_count` and `closed_count` the count of their respective type of parentheses from `parens

# - iterate over the characters in `parens`
#   - if current char is equal to '(':
#     - increment `open_count` by 1
#   - else
#     - increment `closed_count` by 1
#   - return false if `cloased_count` is greater than `open_count`
# - return `true` - if code gets to this point, then string must be balanced


# **Code Implementation**

# def balanced?(string)
#   parens = string.delete("^()")
#   return false if parens.length.odd? || parens[0] == ')'
  
#   open_count = 0
#   closed_count = 0
  
  
#   parens.each_char do |char|
#     char == '(' ? open_count += 1 : closed_count += 1
#     return false if closed_count > open_count
#   end
      
#   true
# end
    
  
  
  
# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false  


# further Exploration
# Expand the above to balance a string for quote, double quote, square brackets, and 
# curly brackets

# - Can use same pattern as above, will just have to account for more types of characters
# - possibly create a hash to store the counts with each key being a different character
# - can use the formula from the given solution , where it increments for open characters and decrements
# for closed ones, also it has  break condition after each char check 
#   to see if the count of that char evern dipped below 0.
# - This would indicate that a closed character appeared before an open one, therefore
# it is not balanced and should return false
# balance_chars = { parentheses: 0, brackets: 0, Curlies: 0, quotes: 0, double_quotes: 0}
# - for quotes and double quotes, they just need to have an even amount included in the string 
# to be considered balanced
# - conditions i Need to return `false` on are now: 
#   - length of string after removing non balance chars is odd
#   - if count of double quote chars or single quote chars is odd

# Iterate over the match_chars
# - use case statement for current char
#   - when open parentheses, increment balance_chars of :parentheses by 1
#   - when it's a closed parentheses, decrement :parentheses by 1
#   - repeat this 2 step check for  brackets and curlies
#   return false if any of these in balance_chars is less than 1 for its value

def balanced_too?(string)
  return false if string.count("'").odd? || string.count("\"").odd?
  
  balance_chars = { 
    parentheses: 0,
    brackets: 0,
    curlies: 0, 
  }

  
  match_chars = string.delete("^()[]{}")
  
  match_chars.each_char do |char|
    case char
    when '(' then balance_chars[:parentheses] += 1
    when ')' then balance_chars[:parentheses] -= 1
    when '[' then balance_chars[:brackets] += 1
    when ']' then balance_chars[:brackets] -= 1
    when '{' then balance_chars[:curlies] += 1
    when '}' then balance_chars[:curlies] -= 1
    end
  return false if balance_chars.values.any? { |count| count < 0}
  end
  
  balance_chars.values.all? { |count| count == 0}
end


p balanced_too?("What \"\"'[]{}(is) this?'") #== true
# p balanced_too?('What is) this?') == false
# p balanced_too?('What (is this?') == false
# p balanced_too?('((What) (is this))?') == true
# p balanced_too?('((What)) (is this))?') == false
# p balanced_too?('Hey!') == true
# p balanced_too?(')Hey!(') == false
# p balanced_too?('What ((is))) up(') == false  