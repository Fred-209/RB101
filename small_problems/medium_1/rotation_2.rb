# # Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.



# **Rules/Requirements**

# *Input*: integer, integer
# *Output*: integer

# *Explicit*: 
# - You may reuse the methods from Rotation (Part 1)
# - Rotating one digit should just return the given integer
# - `n` is always a positive integer
# *Implicit*: 



# **Examples/Test Cases**
# ```ruby
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
# ```

# **Data Structure**

# **Algorithm**

# *High Level*
# - Determine which digits are the last `n` digits from the given integer
# - With these determined, move the first number of these digits to the end
# - Return the entire given integer with those numbers swapped

# *Implementation*

def rotate_array(arr)
  arr.size == 0 ? arr : arr[1..] + [arr[0]]
end

def rotate_rightmost_digits(number, digits_to_rotate)
  num_array = number.digits.reverse
  unmodified_numbers = num_array.first(num_array.size - digits_to_rotate)
  rotated_numbers = rotate_array(num_array.last(digits_to_rotate))
  (unmodified_numbers + rotated_numbers).join.to_i
  
end

p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(735291, 1) == 735291
