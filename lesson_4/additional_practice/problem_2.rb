# Practice Problem 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_of_ages = ages.values.sum
p total_of_ages

# Manual Iteration method with each

age_total = 0
ages.each { |_, age| age_total += age}
p age_total

# Alternate reduce/inject method

p ages.values.reduce(:+)

# Using a loop

age_total = 0
counter = 0
names = ages.keys


loop do
  break if counter == ages.size
  current_age = ages[ names[counter] ]
  age_total += current_age
  counter += 1
end

p age_total

