s#olved 12/28 about 28 min
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Examples:


# **Rules/Requirements**

# *Input*: 3 integers (represents 3 sides of a triangle)

# *Output*: one of four symbols
#   -:equilateral, :isosceles, :scalene, :invalid


# *Explicit Requirements*: 
# - a triangle is valid if the sum of the length of its two shortest sides are greater than the 
#   length of the longest side
# - all sides must also have lengths greater than 0 to be a valid triangle


# *Implicit Requirements*: 
#  - return :equilateral if all 3 sides are the same (given integer)
# - return :isosceles if 2 sides are equal while a third is different
# - return :scalene if all three sides are of different length


# *Questions:*

    
# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid
# ```

# **Data Structure**
# Initial: 3 integers

# Intermediate: 
#  - use a helper method to test for triangle validity
# - probably use an array to store the sides, gives ability to sort

# Final: one of the four symbols as return value



# **Algorithm**

# *High level thought process / brainstorming ideas
# First test for validity using a helper method. Return :invalid if the triangle is not a valid one based on the return of this helper method *valid_triangle?(side_1, side_2, side_2)
# - if all 3 sides are the same, return :equilateral
# - store the sides in a array , sort this array in ascending order
# - THis will cause the shortest 2 sides (if they are shorter) to be at index 0 and 1
# - If the first 2 elements in sides are equal to each other, then return :isosceles
# - else return :scalene

# *Lower level steps of implementation*
# - return :invalid unless valid_triangle?(3 sides go here)
# - assign `sides` to be an array containing the three elements, sort it in ascending order
# - return :equilateral if all elements in `sides` equal one another
# - return :isosceles if after removing duplicates, the count of sides is 2
# - return :scalene at this point, as others have been ruled out

  
# *valid_triangle?(sides)
# - sort sides in ascending order
# - return true if the sum of side at index 0 and index 1 are greater than the side at index 2 AND all sides are greater than 0

# **Code Implementation**
    
def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3].sort
  
  return :invalid unless valid_triangle?(sides)
  return :equilateral if sides.all?(sides[0])
  return :isosceles if sides.uniq.count == 2
  return :scalene
  
 
end

def valid_triangle?(sides)
  sides.all? { |side| side > 0 } && (sides[0] + sides[1]) > sides[2] 
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
 

