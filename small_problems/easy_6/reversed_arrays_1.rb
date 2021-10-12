# # Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# **Rules/Requirements**

# *Input*: an array
# *Output*: the same array, mutated

# *Explicit*: 
# - may not use Array#reverse or Array#reverse!
# - reverse the elements of the array in place

# *Implicit*: 
# - If the argument is an empty array, return an empty array
# - return the original object
# - 


# **Examples/Test Cases**
# ```ruby
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true
# ```

# **Data Structure**

# **Algorithm**

# - Going to need to use element reassignment in order to modify the original object instead of creating a new object - array
# - Need to swap the element at beginning of array with the one at the end
#   - Then move up one element from the beginning, and one back from the end, then swap those, and so on a number of times
#     - The number of times to perfom this operation will be the size/length of the original array / 2
#     - Set `front_idx` to 0, 'back_idx` to -1'
#   - In ruby, orginal_array.times do swap
#     - arr[front_idx] , arr[back_idx] = arr[back_idx], arr[front_idx]
#       Increment front_idx by 1, decrement back_idx by 1
#  - Returnt he original array     

 def reverse!(arr)
  front_idx = 0
  back_idx = -1
  number_of_swaps = (arr.size) / 2

  number_of_swaps.times do |_|
    arr[front_idx], arr[back_idx] = arr[back_idx], arr[front_idx]
    front_idx +=1
    back_idx -= 1
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true