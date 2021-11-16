# # Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all the 
# numbers together, divides the result by the number of entries in the Array, and
#  then prints the result rounded to 3 decimal places. Assume the array is non-empty.

# **Rules/Requirements**

# *Input*: array of integers
# *Output*: a string
# *Explicit*: 
# - the array will consist of only integers
# - the array will not be empty
# - All the entries in the array need to be multiplied together
# - The result of multiplying all entries in the array needs to be divided by the
#   total number of items in said array
# - This result should be printed to the screen and rounded to 3 decimal places


# *Implicit*: 
# - The array can be only one number long
# - THe rounded number needs to have 3 decimal places even if they are all 0
# - The return string needs to preface the number result with 'The result is '
# - The integer result needs to be converted to a float at some point, otherwise
#   integer division will be used and that will not give an accurate final result
#   for rounding to 3 decimal places. 

# *Questions:*
# - What happens if the only entry is a 0?
#   - 0 should be ok as is, since the division would end up being '0 divided by the 
#     number of elements', no division BY 0
# - Will a one element array make a difference for the steps to solve this problem?
#   - No, as it can still be multipled by the elemen

# **Examples/Test Cases**

# ```ruby
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
# ```

# **Data Structure**
# Initial: Array
# Intermediate: A float
# - achieved by performing operations on the integers in the given array
# Final: string, 

# **Algorithm**

# *Multiply all the numbers together from the given array of integers, convert to float Divide this 
# number by the count of elements in this array. Round this answer to 3 decimal places.
# Return the string 'The result is X' where 'X' is the answer from above, rounded
# to 3 decimal places, making sure to include trailing 0's.*

# - Assign variable to result of multiplying each element in the given array by each other
#   - `Array#sum or Enumerables#reduce would work here`
# - Divide above answer by the count of elements in the given array, as a float
# - return the string "The result is X" and for X, substitute in the aabove result
#   formatted to 3 decimal places

# **Code Implementation**

def show_multiplicative_average(number_list)
  result = number_list.reduce(:*).to_f
  result = result / number_list.size
  formatted_result = sprintf("%.3f", result)
  "The result is #{formatted_result}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667