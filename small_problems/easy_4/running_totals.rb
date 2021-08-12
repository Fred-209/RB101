# Running Totals

# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# *RULES/REQUIREMENTS**

# *Input*: an array of numbers
# *Output*: an array of numbers

# *Explicit*: 
# - The returned array must have the same number of elements as the given array
# - Each consecutive element in the returned array must be the running total of adding up the previous elements in the array

# *Implicit*: 
# - The given array can be empty
# - The first element of the returned array will always be the same as the first element from the given array

# **EXAMPLES**

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# **DATA STRUCTURE**

# **ALGORITHM**

# - Set the variable `total` to 0
# - Initialize an empty array `total_array'
# - Remove the first element of the given array and increment `total` by this amount
# - Add `total` onto the end of `total_array`
# - Repeat the previous 2 steps until the given array is empty
# - Return `total_array`

# def running_total(number_array)
#   total = 0
#   total_array = []

#   until number_array.size == 0 
#     total += number_array.shift
#     total_array << total
#   end
  
#   total_array
# end


# alternate version using #map

# def running_total(array)
#   sum = 0
#   array.map { |number| sum += number}
# end

# alternate version using Enumerable#each_with_object

def running_total(array)
  sum = 0
  array.each_with_object([]) { |number, new_array| new_array << sum += number}
end
9ui8 9
# alternate version using Enumerable#reduce

def running_total(array)
  new_array = []
  new_array << array[0]


end
p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []



