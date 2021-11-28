# # Rotation (Part 3)

# If you take a number like 735291, and rotate it to the left, you get 352917.
#  If you now keep the first digit fixed in place, and rotate the remaining digits,
#   you get 329175. Keep the first 2 digits fixed in place and rotate again to 
#   321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
#    Finally, keep the first 4 digits fixed in place and rotate the final 2 digits
#     to get 321579. The resulting number is called the maximum rotation of the 
#     original number.

# Write a method that takes an integer as argument, and returns the maximum 
# rotation of that argument. You can (and probably should) use the 
# rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# **Rules/Requirements**

# *Input*: an integer
# *Output*: integer

# *Explicit*: 
# - You can use the rotate_rightmost_digits from previous exercise
# - You do not have to handle multiple 0's

# *Implicit*: 
# - The number of rotations to perform will be one less than the length of the number


# *Questions:*

# **Examples/Test Cases**

# ```ruby
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845
# ```

# **Data Structure**

# Initial: integer
# Intermediate: array
# Return: integer

# **Algorithm**
# - assign 'rotated_number' to a copy of the given number
# - Set 'num_rotations' to the number of digits in the given integer, -1
# - Iterate from 'num_rotations' down to 1:
#   - assign variable 'rotated_number' to the result of calling 'rotate_rightmost_digits'
#   passing in rotated_number as the first argument, and current iteration number
#   as the second argument
# return 'rotated_number'

# **Code Implementation**

def rotate_array(arr)
  arr.size == 0 ? arr : arr[1..] + [arr[0]]
end

def rotate_rightmost_digits(number, digits_to_rotate)
  num_array = number.digits.reverse
  unmodified_numbers = num_array.first(num_array.size - digits_to_rotate)
  rotated_numbers = rotate_array(num_array.last(digits_to_rotate))
  (unmodified_numbers + rotated_numbers).join.to_i

end

# def max_rotation(number)
#   rotated_number = number.clone
#   num_rotations = rotated_number.digits.size

#   num_rotations.downto(2) do |num_digits_to_rotate|
#     rotated_number = rotate_rightmost_digits(rotated_number, num_digits_to_rotate)
#   end  
#   rotated_number
# end

# *Take the first digit, move it to the end of the number* = 735291 -> 352917
# move to index 1, take that number and move it to end 352917 => 329175
# move to index 2, take that number and move to end 329175 => 321759
# move to index 3, take that number and move to end 321759 321597
# move to index 4, take that number and move to end 321597 => 321579
# ----


def max_rotation(number)
  digits = number.to_s.chars

  ((digits.size) -1).times do |i|
    digits.push(digits.delete_at(i))
  end

  digits.join.rjust(digits.size)
end

p max_rotation(735291) # == 321579
p max_rotation(3) # == 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845