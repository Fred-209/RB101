# # Does My List Include This?

# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# **Rules/Requirements**

# *Input*:2 arguments, array and a search value
# *Output*: boolean

# *Explicit*: 
# - Cannot use Array#include? to determine this
# - Return true if the search element is found in the given array, false otherwise

# *Implicit*: 

# *Questions*
# - Can the search value argument be a collection? (array or hash?)


# **Examples/Test Cases**
# ```ruby
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false
# ```

# **Data Structure**

# **Algorithm**

# - One liner below using Enumerables#any?
# - Not cheating method...:
#   - Iterate over the given array
#     - If current element is equal to search_value, return true
#   - Return False (line should not evaluate if `true` was returned from iteration above)

# One Liner
  # def include?(array, search_value)
#   array.any?(search_value)

# end

def include?(array, search_value)
  array.each { |num| return true if num == search_value}
  false
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

