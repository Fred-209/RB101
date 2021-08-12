# Practice Problem 4

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min_age = ages.values.min
p min_age

# Using sort and fetch

min_age = ages.values.sort.fetch(0)
p min_age
