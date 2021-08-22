# # Practice Problem 1

# How would you order this array of number strings by descending numeric value?

# arr = ['10', '11', '9', '7', '8']

# Answer: 

arr = ['10', '11', '9', '7', '8']
arr.map(&:to_i).sort.reverse

# or

arr.sort do |a,b|
  b.to_i <=> a.to_i
end
