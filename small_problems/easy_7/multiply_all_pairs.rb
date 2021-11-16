# # Multiply All Pairs

# Write a method that takes two Array arguments in which each Array contains a list
#  of numbers, and returns a new Array that contains the product of every pair of 
#  numbers that can be formed between the elements of the two Arrays. The results 
#  should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# **Rules/Requirements**

# *Input*: 2 arrays, both containing numbers
# *Output*: 1 array

# *Explicit*: 
# - Neither argument will be an empty array
# - Every possible combo of two numbers between the two given arrays should be multipled
#   be each other, and these products will be the elements in the return array
# - The return array should be sorted by increasing value


# *Implicit*: 
# - The arrays can be different lengths
# - Numbers can be duplicated in the return array

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# ```

# **Data Structure**
# Initial: 2 arrays
# Intermedite:
# - 1 empty array to add elements to. These elements will be the products of the pairs
#   listed in the rules
# Final: an array

# **Algorithm**

# *Iterate over both arrays in a nested fashion, multiplying each current element by 
# each other, and add them to a new array*
# - Create an empty array `products`
# - Traverse all elements in num_array_1
#    - Traverse all elements in num_array_2
#     - Multiply current element from num_array_1 by current element from num_array_2
#     - append this result to `products`
# - Sort `products` by increasing value
#   - default sort method type is increasing
# - Return `products`


# **Code Implementation**

def multiply_all_pairs(num_array_1, num_array_2)
  products = []
  num_array_1.each do |array_1_number|
    num_array_2.each do |array_2_number|
      products << array_1_number * array_2_number
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

#One liner using Array#product

def multiply_all_pairs(num_array_1, num_array_2)
  num_array_1.product(num_array_2).map{ |pair| pair.reduce(:*)}.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
