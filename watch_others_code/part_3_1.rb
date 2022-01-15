
# *Input*: array of integers
# *Output*: integer

# *Requirements*
# - return 0 if the given array is empty, or only contains negative numbers
# - find the integer that is the greatest possible sum from adding up 
# subsequences (contiguous) made from the given array
# - 
# *Inferred from description/ test cases*

# *Questions*

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby

# ```

# **Data Structure**


# **Algorithm**

# *High level thought process / brainstorming ideas
# - return 0 if all elements in given array are negative (less than 0) or if array is empty

# - Find the sum of every possible contiguous subsequence that can be made from the given array of numbers, find the sum of that subsequence, and the largest one of these sums is the return value I'm looking for
# - create a variable and init 0 initially, that will be used to track the largest sum found so far
# - as each subsequence sum is found, test it against the current value assigned to the largest_sum variable, and replace it if the current value is larger
# - Iterate over the array of every subsequence found
#   - calculate the sum of all integers found in current subarray
#   - if sum is large than largest_sum, reassign largest_sum to this current sum
# - return the largest sum found variable


# * finding all contiguous subsequences from given array of numbers*

# - Use start index and end index to know what parts of the given array to slice from
#   - use nested loops, and create subsequences from start index through end index, incrementing end index in the innner loop, and incrementing start index in the outer loop
#   - outer loop iterates over a range of all the indexes found in given array
#   - inner loop iterate over a range of numbers ( representing index values) from start_index through the length of the given array, exclusive
  
# - start index is initially 0, and so is end index
# - may use helper method for this 'get_continguous_subsequences(array of integers)
# - create an empty array at start of helper method, subsequences, to store the subsequences found
# - in the inner loop iteration above, add the subsequence found that is at index values start index through end index, to `subsequences` array
# - return `subsequences`


# *Lower level steps of implementation*
# - create helper method 'get_contiguous_subsequences(given array)
# - return 0 if given array.empty? or all elements in given array are negative
# - init `subsequences` to the result of calling `get_contiguous_subsequences(given array)
# - int largest_sum_found to 0
# - Iterate over `subsequences`
#   - calculate the sum of current subsequence
#   - if this sum is > than largest_sum_found
#     - reassign largest_sum_found to this found sum
# - return largest_sum_found


# *get_contiguous_subsequences(array)
# - init subsequences to []
# - Iterate over each indx of `array`, `start_idx`
#   - Iterate over a range from (start_idx through size of `array`, exclusive, `end_idx
#     - call [] on the `array` with a range from start_idx through end_idx inclusive, and append this subsequence to `subsequences`
# - return subsequences



# **Code Implementation**

def max_sequence(num_array)
  return 0 if num_array.empty? || num_array.all?(&:negative?)
  subsequences = get_contiguous_subsequences(num_array)
  largest_sum = 0
  
  subsequences.each do |subsequence|
    if subsequence.sum > largest_sum 
      largest_sum = subsequence.sum
    end
  end
  largest_sum
end


def get_contiguous_subsequences(num_array)
  subsequences = []
  
  num_array.each_index do |start_idx|
    (start_idx...num_array.size).each do |end_idx|
      subsequences << num_array[start_idx..end_idx]
    end
  end
  subsequences
end
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
# p get_contiguous_subsequences([1, 2, 3, 4, 5])

