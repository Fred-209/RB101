solved on 12/28, took 14:45

# Tri-Angles
# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.


# **Rules/Requirements**

# *Input*: 3 integers

# *Output*: one of 3 symbols
# - :acute, :right, :invlaid


# *Explicit Requirements*: 
# - A triangle is valid if the sum of its degrees are 180 AND all angles are 
# greater than 0
# - a triangle is :right if only 1 of the angles is 90
# - a triangle is :acute if all angles are < 90
# - a triangle is :obtuse if one angle is greater than 90

# *Implicit Requirements*: 
#  -


# *Questions:*
# - Will the given integers always be positive?
#   - will be invalid if any angle is less than 0

# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid
# ```

# **Data Structure**
# Initial: 3 integers

# Intermediate: helper method to determine triangle validity, maybe an array to hold 
# the side integers

# Final: one of three different symbols to return



# **Algorithm**

# *High level thought process / brainstorming ideas
# - assign the sides given to an array to store them
# - using helper method `valid_triangle?`, test to make sure the triangle is valid using
# the criteria specified, return :invalid if this method returns `false`
# - IF exactly one of the sides is equal to 90, return :right
# - return :acute if all of the sides are < 90
# return :obtuse otherwise

# *Lower level steps of implementation*
# - init `sides` to an array containing the three given integers
# - return `:invalid` unless the triangle is valid, using valid_triangle? helper method to determine this
# - return :right if exactly one angle in `sides` is equal to 90
# - return :acute if all sides in `sides` are less than 90
# - return :obtuse

# *valid_triangle(sides) - sides is an array
# if all angles in sides is > 0 AND the sum of all the sides is 180, return true, false otherwise



# **Code Implementation**

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]
  
  return :invalid unless valid_triangle?(sides)
  return :right if sides.one?(90)
  return :acute if sides.all? { |side| side < 90 }
  return :obtuse
  
end

def valid_triangle?(sides)
  sides.reduce(:+) == 180 && sides.all? { |side| side > 0 }
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid