# # Combininb Arrays

# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# **Rules/Requirements**

# *Input*: 2 arrays
# *Output*: 1 array

# *Explicit*: 
# - The returned array should have no duplicate values
# - The returned array should be a combination of all values from the 2 given arrays

# *Implicit*: 



# **Examples/Test Cases**
# ```ruby
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# ```

# **Data Structure**

# **Algorithm**

# - Create `merged_array` empty array
# - Iterate over the first argument
#   - If the current element is not already a part of `merged_array`, add it to it
# - Iterate over the second argument array
#   - - If the current element is not already a part of `merged_array`, add it to it
# - return `merged_array`

def merge(arr_1, arr_2)
  merged_array = []

  arr_1.each { |num| merged_array.push(num) if !merged_array.include?(num)}
  arr_2.each { |num| merged_array.push(num) if !merged_array.include?(num)}
  
  merged_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
