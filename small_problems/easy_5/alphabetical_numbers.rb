# # Alphabetical Numbers

# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# **Rules/Requirements**

# *Input*: an array of integers
# *Output*: an array of integers, sorted

# *Explicit*: 
# - The integers in the given array will only range from 0-19
# - 


# *Implicit*: 
# - Only need to code for one test case here, one specific argument


# **Examples/Test Cases**
# ```ruby
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
# ```

# **Data Structure**

# **Algorithm**

# Need to match the numbers 0-19 with their associated english word
# - Hash or 2 dimensional array seems it would work
# - Can i sort a 2 dimensional array based on the first element of the inner array?
#   - After testing, yes i can! using sort_by

# - Create an array `num_words` that is made up of string elements that are 'zero' through 'nineteen'

NUM_WORDS = %w(zero one two three four five six seven eight nine
               ten eleven twelve thirteen fourteen fifteen sixteen
               seventeen eighteen nineteen)

# def alphabetic_number_sort(num_array)
#   num_and_word_arr = num_array.zip(NUM_WORDS)
#   sorted_multi_arr = num_and_word_arr.sort_by { |arr| arr[1] }
  
#   sorted_num_arr = []
#   sorted_multi_arr.each do |arr|
#     sorted_num_arr << arr[0]
#   end
#   sorted_num_arr
# end
 
# More direct method without involving Array#zip
# def alphabetic_number_sort(num_array)
#   num_array.sort_by { |number| NUM_WORDS[number]}
# end


# Further Exploration: 
# - rewrite the method to use Enumerable#sort instead of Enumerable#sort_by

def alphabetic_number_sort(num_array)
  num_array.sort { |a, b| NUM_WORDS[a] <=> NUM_WORDS[b]}
end

p alphabetic_number_sort((0..19).to_a) #== [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]





