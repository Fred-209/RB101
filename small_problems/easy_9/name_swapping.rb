# # Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a 
# single String argument, and returns a string that contains the last name, a 
# comma, a space, and the first name.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a string

# *Explicit*: 
# - return the given string in the format "last name, first name"
# - the given string will will always contain "first_name last_name"


# *Implicit*: 

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# swap_name('Joe Roberts') == 'Roberts, Joe'
# ```

# **Data Structure**

# Initial: string
# Intermediate: array
# Return: string

# **Algorithm**
# - split the given string up into an array of its words, space is the delimiter
# - reverse the order of the array elements (should now be last_name first_name)
# - return a string that contains "array[0], array[1]"

# **Code Implementation**

def swap_name(full_name)
  first_name, last_name = full_name.split
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'