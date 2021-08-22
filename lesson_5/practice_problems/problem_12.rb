# # Practice Problem 12

# # Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# **RULES/REQUIREMENTS**

# *Input*: nested array
# *Output*: a hash

# *Explicit*: 
# - Do not use Array#to_h method to solve this problem
# - In the new hash, the first element from each sub-array should be the key, and the second element should be the value

# **EXAMPLES**

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# **DATA STRUCTURE**
# -  A nested array just being transformed into a hash, keeping all values the same. The element at index 0 of each sub-array should be the key name, and the element at index 1 should be the value for that key

# **ALGORITHM**

# - Create a new empty hash, `transformed_hash`
# - Iterate over `arr`
#   - For each sub-array being iterated over, assign the object at index 0 of the current element to be the key and the object at index of 1 to be the value of a new key/value pair entry in `transformed_hash`
# - Return `transformed_hash`

# **IMPLEMENTATION**

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

transformed_hash = {}

arr.each do |sub_array|
  transformed_hash[sub_array[0]] = sub_array[1]
end

p transformed_hash

