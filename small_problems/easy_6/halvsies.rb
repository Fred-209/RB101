# # Halvsies

# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# **Rules/Requirements**

# *Input*: an array
# *Output*: a nested array

# *Explicit*: 
# - If the original array has an odd number of elements, the middle element should be placed in the first half array

# *Implicit*: 
# - an empty array should return a 2-dimnesional empty array
# - If only one element in the given array, it should be added to the first half array


# **Examples/Test Cases**
# ```ruby
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]
# ```

# **Data Structure**
# [1, 2, 3, 4, 5] => [[1, 2, 3], [4, 5]]
# **Algorithm**

# 1. Create `whole_array` empty array
# 1. Determine if the given array contains an even or odd number of elements
#   - If the number of elements are odd, then the number of elements added to the first-half array should be (number of array elements / 2) + 1. 
#   - The number of second-half array elements will bee (number of array elements / 2)
# 2. If number of array elements are odd:
#   - Add the elements with index from 0 through index of (length of given array / 2) as a sub-array, at index 0, or `whole_array
#   - Now `whole_array` should be a 2-dimensional array with one element, a sub array, as it's only element
#   - Add the elements in the given array from index (length of array / 2) + 1 to the last index as the second element in `whole_array`
#     - This should be another array of the numbers in this range
# 3. If the number of given array elements are even: 
#   - The first half array should consist of the elements at index 0 through the index of (length of given array) - 1.
#   - The second half array (of whole_array), should consist of the index values from (length of given array /2) through the last element index of the given array
# 4. Return `whole_array`

def halvsies(arr)
  whole_array = []

  if arr.size.odd?
    whole_array[0] = arr[0..(arr.size / 2 )]
    whole_array[1] = arr[(arr.size / 2 + 1)..-1]
  else
    whole_array[0] = arr[0..(arr.size / 2 - 1)]
    whole_array[1] = arr[(arr.size / 2)..-1]
  end
  whole_array
end


p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]