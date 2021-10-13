# # Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# **Rules/Requirements**

# *Input*: an array
# *Output*: an array

# *Explicit*: 
# - Do not modify the original array
# - Do not use the Array#rotate or Array#rotate! methods

# *Implicit*: 
# - The array can consist of elements of various types of objects
# - The array can be only one element in size, or empty


# **Examples/Test Cases**
# ```ruby
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true
# ```

# **Data Structure**

# **Algorithm**

# *High Level* 
# - Create a new array that consists of the given array's elements, but in a different order.
# The first element of the given_array should be moved to the end 

def rotate_array(arr)
  case arr.length
  when 1 || 0
    arr
  else
    arr[1..-1] + [arr[0]]
  end
end

p rotate_array([7, 3, 5, 2, 9, 1])
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# Implement this rotation with a string instead of an array

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string('This is a string')
p rotate_string("Another string, this is.")
p rotate_string('a')
p rotate_string('b')

def rotate_integers(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_integers(45556) == 55564
p rotate_integers(8938) == 9388
p rotate_integers(5 ) == 5