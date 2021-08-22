# # Practice Problem 15

# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# **RULES/REQUIREMENTS**

# *Input*: an array of hash elements
# *Output* : an array

# *Explicit*: 
# - Return an array that contains hashes
#   - Only return hashes that contain ALL even integers from the initial given argument

# **EXAMPLES**

#   arr = [{a: [1, 2, 3]}, {b: [2, 4, 6]}] => [{b: [2, 4, 6]}]

# **ALGORITHM**

# - Iterate over the given array of hashes
#   - Iterate over each hash element, jey/value pair
#     - If all of the values for each hash key/value pair are even integers, return hash
#     - Every value in the hash must be even in order for to be a valid return hash: cannot split up the hash's keys, must be all or nothing



arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.keep_if do |hash|
  hash.values.flatten.all? { |number| number.even?}
end 

p arr

# Solution from Launch School
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]


