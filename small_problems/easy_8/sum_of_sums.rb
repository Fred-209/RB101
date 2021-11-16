# # Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the 
# sums of each leading subsequence for that Array. You may assume that the Array 
# always contains at least one number.


# **Rules/Requirements**

# *Input*: array of numbers
# *Output*: a number

# *Explicit*: 
# - Return the sum of sums from each subsequence for the rray
# - The array will always contain at least one number


# *Implicit*: 
# - Each subsequence is every number added consecutively
#   - [3, 5, 8] is 3 + (3 + 5) + (3 + 5 + 8)

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35
# ```

# **Data Structure**
# Initial: Array of numbers
# Intermediate: an empty array to build upon

# Final:
# **Algorithm**

# *Add up the total of every subsequence in a given array. A subsequence starts 
# at the digit at index 0, next subsequence is numbers at index 0 and 1, next is numbers
# at index 0, 1, 2...etc*

# - create an empty array to hold every number from the subsequences
# - Iterate over the given array X times, where X is the count of elements in the array
#   - Each iteration, add the numbers from index 0 - index of current iteration count to 
#     the empty array from above
#       - for each index in a range from 0 to current index, add number from given array 
#         at this index position to the created array from above.
# - Add all the numbers from this newly filled array together
# - Return this result



# **Code Implementation**

# def sum_of_sums(num_array)
#   number_basket = []
#   num_array.size.times do |iteration_count|
#     (0..iteration_count).each do |index|
#       number_basket << num_array[index]
#     end
#   end
#   number_basket.sum
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

#Using solution provided, sum_total and accumulator

def sum_of_sums(num_array)
  subsequence_total = 0
  sum_total = 0 
  
  num_array.each do |number|
    subsequence_total += number
    sum_total += subsequence_total
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35