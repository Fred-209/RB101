# # Reversed Arrays (Part 2)

# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# **Rules/Requirements**

# *Input*: an array
# *Output*: an array

# *Explicit*: 
# - do not modify the given array
# - do not use the same method as the last assignment
# - The order of the elements in the given array should be returned in reverse order, in a new array
# - Do not use Array#reverse or Array#reverse!

# *Implicit*: 



# **Examples/Test Cases**
# ```ruby
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true
# ```

# **Data Structure**

# **Algorithm**

# - Add the elements from the end of the array to an empty array
# - Repeat this for each element in the given array, counting back from the end
# - Return this new array

# - Define method `reverse` that takes one argument, `arr`
#   - Create empty array reversed_arr
#   - set idx = -1
#   - set num_times = to the number of elements in the given array
#   - Loop num_times times
#     - Add the last element from `arr` to `rev_arr`
#     - decrement idx by 1
#   - return rev_arr

# def reverse(arr)
#   reversed_arr = []
#   idx = -1
#   iterations = arr.size

#   iterations.times do |_|
#     reversed_arr.push(arr[idx])
#     idx -= 1
#   end

#   reversed_arr
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# p new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

#Using the Enumerables#each_with_object method
# - Call #each_with_object on the given array, and prepend each element to the accumulator object

def reverse(arr)
  arr.each_with_object([]) { |ele, reversed_array| reversed_array.prepend(ele)}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true