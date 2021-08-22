# Practice Problem 9

# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# **RULES/REQUIREMENTS**

# *Input*: a multi-dimensional array
# *Output*: a multi-dimensional array

# *Explicit*: 
# - Keep the same structure of the array and sub-arrays, just sort them according 
# to the given criteria
# - The sub-arrays should be sorted in descending order
# - Return a NEW array


# *Implicit*
# - The sub-arrays can contain either string elements or integers as elements

# **EXAMPLES/TEST CASES**

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']] 
# => 
# arr = [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]

# **DATA STRUCTURE**

# **ALGORITHM**

# - Iterate over the given `arr` array
#   - I want to transform the elements in place, using a sort
# - Use the combined comparison operator to compare each element (a and b)
#   and make sure to put 'b' on the left of the operator, as this will cause the 
#   sort order to be descending instead of the default ascending

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  sub_array.sort { |a, b| b <=> a}
end

