# **Notes/Brainstorming**
# - Move rows at index X to a column at index X instead
# - All elements currently in row 0, need to be moved to 'column' 0 instead
#   - column 0 means for each of those elements, they are at element 0 of whatever row
#   - their row will be the same as their previous index value of their row
#   - example: an element found at row 0, index 2 will [0][2] will now be found at
#   row 2, index 0 [2][0]
#   - This pattern seems to hold true for every element, swap their 'coordinates'
#   - How do I swap their positions? 
#     - I need to record their current positions (index values)
#   - Iterate over every row (subarray) with index, 'row_index'
#     - iterate over every element within this subarray, with index 'element_index'
#       new_matrix[row_index][element_index] = matrix[element_index][row_index]
#  if the count of rows is not that same as the count of elements in the row, 
#  this means the matrix is not a square
#  - can make it a square by filling in the missing parts with empty arrays []
#  and then delete these empty arrays after the array has been modified
#  - if the count of elements in the first row is greater than the count of total 
#   rows in the matrix, then I need to create empty arrays in the row until the number
#   of of array elements in a row is equal to the count of elements from the original 
#   row 0
#   - if the count of rows (subarrays) is greater than the count of elements in row 0,
#     then i need to add elements to each row until the count of elements is equal 
#     to the number of rows
#     - use a placeholder element that can be deleted in one go, maybe a string
# - init a counter `reverse_idx` to the count of subarrays - 1
# - iterate backwards over the matrix (now with correct number of subarrays)
#   - assign matrix of reverse_idx to the last element from matrix row 0
#     - pop this element off, as to mutate row 0
#   - decrement reverse_idx by 1



# *Lower level* 

# - init `subarray_count` to the number of subarrays in the given matrix (using count method)
# - init `element_count_in_subarray` to the count of elements from subarray 0
# - if `element_count_in_subarray` is > than `subarray_count`: 
#     - init `num_subarrays_to_add` to `element_count_in_subarray` - `subarray_count`
#     - add empty subarrays to matrix `num_subarrays_to_add` times 
      # - init `reverse_idx` to subarray_count -1
      # - Iterate `subarray_count` times
      #   - assign matrix[reverse_idx] to matrix of row 0's last element, destructive
      
# # matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

matrix = [ [1, 2, 3, 4] ]

def transpose(matrix)
  new_matrix = matrix.map(&:dup)
  
  subarray_count = new_matrix.count
  element_count = new_matrix[0].count

  matrix = create_square_matrix(matrix) unless subarray_count == element_count
  if element_count > subarray_count
    num_subarrays_to_add = element_count - subarray_count
    num_subarrays_to_add.times { new_matrix << [] }
    

    subarray_count = new_matrix.count
    reverse_idx = subarray_count - 1
    subarray_count.times do |_|
      new_matrix[reverse_idx] << new_matrix[0].pop
      reverse_idx -= 1
    end
    

  end
  
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |ele, ele_idx|
      new_matrix[ele_idx][row_idx] = matrix[row_idx][ele_idx]
    end
  end
  new_matrix.each { |row| p row}
end


def create_square_matrix(matrix)
  
end
transpose(matrix)


#  transpose(matrix) #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

# print matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#    [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]