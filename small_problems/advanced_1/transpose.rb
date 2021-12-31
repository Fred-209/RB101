# # Problem Description

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns 
# the transpose of the original matrix. Note that there is a Array#transpose method
#  that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and 
# leave the original matrix unchanged.

# **Rules/Requirements**

# *Input*: multidimensional array  of 3 elements
# - each sub array has 3 integers as elements

# *Output*: a new multi dimensional array


# *Explicit Requirements*: 
# - do not use the `transpose` method or the `Matrix` class from the standard library
# - 'transpose' the given matrix (multidimensional array), which means to essentially
# swap the rows and columns
# - THis means first row would now be first column, second row would now be second column, etc

# *Implicit Requirements*: 
#  - When transposing, the index value of the subarray will be the index value 
#  for each of its integers when moved to their new subarray (row)
# - example: all elements from subarray of index 0 , when transposed they will each 
# be at index 0 of each of the three subarrays


# *Questions:*

# *Edge Cases*:
# - None, given a strictly 3x3 matrix each time, and the within the subarrays don't 
# matter


# **Examples/Test Cases**
# ```ruby
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# ```

# **Data Structure**
# Initial: multidimensional array

# Intermediate: multidimensional array

# Final: multidimensional array



# **Algorithm**

# *High level thought process / brainstorming ideas
# - When transposing, the index value of the subarray will be the index value 
#  for each of its integers when moved to their new subarray (row)
# - example: all elements from subarray of index 0 , when transposed they will each 
# be at index 0 of each of the three subarrays

# - I need to 'move' each row to its corresponding column
#   - 'first row' (subarray of index 0) should now form a column
#   made up of these elements, all at index 0 of new subarrays
# - to access first subarray in given array, it would be index 0 and then 0,1,2 for each element.
#   - once transposed, new_matrix[0][0], new_matrix[1][0], new_matric[2][0] would access these values
# - One possibility is to iterate over the given matrix one level deep with index, subarray
#   - then iterate over a range of 0..2 , idx
#      - new_matrix[idx][subarray_index] = subarray[idx]
# - So a range iteration of 0..2 nested with the `each` iteration for the given 
# MD array
# - In this nexted iteration setup, the idea is to assign all elements from a given subarray
# in the first iterator method, (tracking the index of this subarray in the larger array), 
# to the same index value of each subarray, and the subarray changes because of this iteration 
# over the range of 0..2
# - Then return the new_matrix


# *Lower level steps of implementation*
# - init an empty multiD array of 3 empty subarrays, `new_matrix`
# - Iterate over the given subarray each with index `subarray`, `subarray_idx`
#   - Iterate over a range of 0..2, `element_idx`
#     - assign new_matrix[element_idx][subarray_idx] to be equal to subarray[element_idx]
# - return new_matrix



# **Code Implementation**

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_matrix = [ [], [], [] ]

  matrix.each_with_index do |subarray, subarray_idx|
    (0..2).each do |element_idx|
      new_matrix[element_idx][subarray_idx] = subarray[element_idx]
    end
  end

  new_matrix
end

# new_matrix = transpose(matrix)

# print new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# print matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# *Further Exploration*

# Make a modified version of `transpose` called `transpose!` that 
# changes the given array in place instead of creating a new one

# All elements in column 0 should be elements of row 0
# ..column 1 to row 1
# ..column 2 to row 2

# - Iterate over the subarrays of `matrix` using map! for transformation in place
#   - the return value of each block iteration should be row that fits above
#   criteria

# - iterate over range of (0..2) `column_idx`
#   - Iterate over matrix using map! with index , `subarray, subarray_idx`
#     - [ matrix[subarray_idx

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]


# def transpose!(matrix)
  

#   (0..2).each do |column_idx|
#     matrix.each_with_index do |subarray, subarray_idx|
#       matrix[subarray_idx][column_idx] = subarray[subarray_idx]
#     end
#   end
# end

# transpose!(matrix)
# p matrix