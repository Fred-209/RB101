#   # All Substrings
  
# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This 
# means that all substrings that start at position 0 should come first, then 
# all substrings that start at position 1, and so on. Since multiple substrings
# will occur at each position, the substrings at a given position should be 
# returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous
# exercise:

#   **Rules/Requirements**
  
#   *Input*: a string
#   *Output*: an array of strings
  
#   *Explicit*: 
#   - Use the method from the previous assignment 'leading_substrings'
#   - Order the return array in order of where in the string the substring began
#   - The order of substrings for each given position should return in order from 
#   shortest to longest
  
#   *Implicit*: 
#   - each set of substrings from a given position will be equal in length to the
#   number of characters from that character to the end of the string
#     - so 'abc' would have 3 substrings in the first group, 2 in the second, and 
#       1 in the last
#       - 'abc' = 'a', 'ab', 'abc',
#         'b', 'bc',
#         'c'
#   *Questions:*
  
#   **Examples/Test Cases**
  
#   ```ruby
#   substrings('abcde') == [
#     'a', 'ab', 'abc', 'abcd', 'abcde',
#     'b', 'bc', 'bcd', 'bcde',
#     'c', 'cd', 'cde',
#     'd', 'de',
#     'e'
#   ]
#   ```
  
#   **Data Structure**
#   Initial: string
#   Intermediate: build upon an empty array
#   Final: Array

#   **Algorithm**
  
#   - Copy in the `leading_substrings` method from the previous assignment
#   - create an empty array in the new `substrings` method
#   - Iterate over each char in the string, with index 'char, idx'
#     - Pass in a string from idx to end of given string to `leading_substrings`
#       - the return value from 'leading_substrings' should be the entire first subset
#         of strings for the first letter in the given string
#       - THis will repeat for each letter in the given string, moving up a position each iteration
#     add this return value (array) to the create array from above
#   - Flatten and return the array

#   **Code Implementation**

  def leading_substrings(str)
    substring_array = []
    str.length.times do |idx|
      substring_array << str[0..idx]
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

  p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]