
# *Input*: array of integers
# *Output*: integer (represents an index value)

# *Requirements*
# - return the index value from the given array where all elements to the left of this index value summed together equal all elements to the right of this index value also summed 
# - return -1 if there is no index that meets this criteria
# - empty arrays count as 0
#   - this means that at index 0, all eleemnts to the left of index 0 would add up to 0, because there is nothing there.
#   - all elements to the left of index equal 0, and all elements to the right of the last element would equal 0

# *Inferred from description/ test cases*
# - whatever index that's currently being calculated as a midpoint does not count for any of the sums (left or right)

# *Questions*

# *Edge Cases*:
 

# **Examples/Test Cases**
# ```ruby
# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
# ```

# **Data Structure**
# array of integers => subarrays of integers => integer

# **Algorithm**

# *High level thought process / brainstorming ideas
# - Iterate over the range of integers given, with index, , making 2 subarrays for each iteration that consisit of all elements to the left of the current element, and another that is all eleemnts to the right of the current element
# - create left_side and right_side arrays for each iteration
# - sum each of these subarrays together, and compare the sum for equality
# - If they are equal, this meets the criteria we're looking for so return the current index of this element
# - If iteration over the given array completes and has not returned an index value, return -1

# * getting left and right subarrays *
# - left side is equal to all elements from index 0 to current index, exclusive
# - right side consists of elements from (current index + 1) through the end of the string


# *Lower level steps of implementation*
# - Iterate over given over index values of given array `idx`
#   - init `left_side` to be a subarray from array[0...idx]
#   - init `right_side` to be a subarray from array[ (idx + 1)..-1]
#   - return `idx` if the sum of left_side is equal to the sum of right_side
# - return -1 if execution reaches this point, as this means no subarrays were found to meet the needed criteria



# **Code Implementation**

def find_even_index(num_array)
  num_array.each_index do |idx|
    left_side = num_array[0...idx]
    right_side = num_array[ (idx + 1)..-1]
    return idx if left_side.sum == right_side.sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

