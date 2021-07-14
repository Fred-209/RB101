# How many?

# Write a method that counts the number of occurrences of each element in a given array.
# ```ruby
# vehicles =  [  'car',  'car',  'truck',  'car',  'SUV',  'truck',  'motorcycle',  'motorcycle',  'car',  'truck'  ]  count_occurrences(vehicles)
# ```

# **Rules/Requirements**

# Input: an array
# Output: a hash (implicitly implied)

# - The words in the given array are case sensitive
# - Need to print out to the screen the element along with its count
# 	- element => count

# **Examples/Test Cases**

# ```ruby
# vehicles =  [  'car',  'car',  'truck',  'car',  'SUV',  'truck',  'motorcycle',  'motorcycle',  'car',  'truck'  ]  count_occurrences(vehicles)

# *Expected output*: 
# car => 4
#  truck => 3 
#  SUV => 1 
#  motorcycle => 2
# ```

# **Data Structure**
# { 
# Element_name => 1 # count of element,
# etc..
# }

# **Algorithm**

# - initialize an empty hash 'vehicle_count'
# - Iterate over every item in the 'vehicles' array
# 	- check to see if 'vechicle_count' has this key name of the element already
# 		- if it does, increment the value of this key by 1
# 		-if it does not, add the element as a key of 'vehicle_count' with a value of 1
# - Print out each entry in the 'vehicle_count' hash in the format:
# 	- "key_name => value"

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'Truck', 'CAR', 'Car'
]

# def count_occurrences(items)
#   item_count = {}

#   items.each do |item|
#     item_count.has_key?(item) ? item_count[item] += 1 : item_count[item] = 1
#   end

#   item_count.each do |item, count|
#     puts "#{item} => #{count}"
#   end
# end

# count_occurrences(vehicles)

# using #uniq and #count and case insenstive

def count_occurrences(items)
  item_count = {}
  items_downcased = items.map { |item| item.downcase}
    
  items_downcased.uniq.each do |item|
    item_count[item] = items_downcased.count(item)
  end

  item_count.each do |item, count|
    puts "#{item} => #{count}"
  end
end

count_occurrences(vehicles)








