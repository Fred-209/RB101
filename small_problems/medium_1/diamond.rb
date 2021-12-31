# # Problem Description

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as 
# an argument to the method. You may assume that the argument will always be an odd integer.

# **Rules/Requirements**

# *Input*: an odd integer

# *Output*: visual 'diamond' output to the screen, made up of the '*' character for blocks



# *Explicit Requirements*: 
# - the total grid size for the diamond will be nxn, where 'n' is the given integer
# - the given integer will always be odd
# - The diamond has 4 points

# *Implicit Requirements/Observations*: 
#  - The count of '*' in the middle row will be the same as the given integer
# - The diamond will need to be drawn from the top down
# - The top (first) row will always be 1 '*', and the same for the bottom row
# - As the rows descend, the count of astericks is always increased by two for each row
# - each row is always 'n' given character slots long, and is a mix of spaces and the '*'
# - rows of '*' seem to be centered with the given integer number as the length to be centered with
  


# *Questions:*
# - How to handle 0 as an argument?
#   - return a blank screen, nothing to draw
# - How to handle an integer of '1'?
#   - Shoould be a single '*' aligned to the left


# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *
 
 
#  diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
# ```

# **Data Structure**
    
# Initial: integer

# Intermediate: 
# - maybe a multidimensional array to hold the rows of '*'
#   - each sub-array would be a different row
#   - Then it would only take a 'puts' method call to display them without the array syntactical characters
# - maybe iterating over a range, using 'puts' to display different amounts of '*' characters depending on the iteration number

# Final: output to screen, diamond shape



# **Algorithm**

# *High level thought process / brainstorming ideas
# - Iterate over a range of numbers starting at 1 and going through given `num`, inclusive. Step by 2
#   - output to screen '*' multipled by current number from range, centered with `num` as the width to center on
#   - This should output the first part of the diamond, now the lower half needs to be outputed
# - Iterate over a range starting at 2 less than the given num, going through 1. stepping by 2
#   - output '*' multiplied by the current range number, centered with `num` as the width to center on


# *Lower level steps of implementation*
    



# **Code Implementation**

def diamond(grid_size)
  1.step(by: 2, to: grid_size) do |star_count|
    puts ('*' * star_count).center(grid_size) 
  end

  (grid_size - 2).step(by: -2, to: 1) do |star_count|
    puts ('*' * star_count).center(grid_size) 
  end
end
  
diamond(5)

# **Further Exploration**
  
# Try modifying your solution or our solution so it prints only the outline of the diamond:

# diamond(9)

#   *
#  * *
# *   *
#  * *
#   *
  

# *Observations on differences from original algorithm*
# - each row is still centered the same
# - what's changed is the number of '*' in the row
# - Only 2 '*' per row, except for the first last row which both have only 1 '*'
# - each row now follows the pattern of '*' + number of spaces that is equal to star count - 2 + '*'

# - Modify above, expand the {} block for each line to a do..end
# - within the block:
#   - if star_count (iteration number passed in) length is equal to 1, puts '*'
#   - else, puts '*' + (' ' * (star_count -2)) + '*'

def diamond_outline(grid_size)
  #top 'half'
  1.step(by: 2, to: grid_size) do |star_count|
    if star_count == 1
      puts '*'.center(grid_size)
    else
      puts ('*' + (' ' * (star_count - 2)) + '*').center(grid_size)
    end
  end
  
  #bottom 'half'
  (grid_size -2).step(by: -2, to: 1) do |star_count|
    if star_count == 1
      puts '*'.center(grid_size)
    else
      puts ('*' + (' ' * (star_count - 2)) + '*').center(grid_size)
    end
  end
end
  
diamond_outline(21)


    
  
