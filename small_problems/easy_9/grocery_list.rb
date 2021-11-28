# # Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities and
#  converts it into an array of the correct number of each fruit.

# **Rules/Requirements**

# *Input*: a 2d array
# *Output*: a single dimensional array

# *Explicit*: 
# - return a new array with the number of fruits written out X number of times, 
# where X is the integer passed in as the element at index[1] of each sub-array
#   - example: [ ['apples', 3]] , 3 would be X, 'apples' needs to be repeated 3 times
#   in the return array ['apples', 'apples', 'apples']

# *Implicit*: 

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]
# ```

# **Data Structure**

# Initial: 2d array
# Intermediate: 
# Return: 1 d array

# **Algorithm**
# - create an empty array `fruits_repeated`
# - Iterate over the given 2d array (fruit, count)
#   - count # of times do:
#     - append fruit to `fruits_repeated`
# - return `fruits_repeated`

# **Code Implementation**

def buy_fruit(fruit_order_list)
  fruit_basket = []
  
  fruit_order_list.each do |fruit, count|
    count.times { |_| fruit_basket << fruit}
  end
  fruit_basket  
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]