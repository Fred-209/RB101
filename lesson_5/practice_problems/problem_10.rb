# Practice Problem 10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

given_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# temp = given_array.map do |hash|
#     accumulator_hash = {}
#     hash.each_pair do |key, value|
#       accumulator_hash[key] = value + 1
#     end
#   accumulator_hash
# end

temp = given_array.map do |hash|
         hash.transform_values { |value| value += 1}
end


p temp
p given_array



