# Easy 2

# question 1
# See if 'Spot' is in this hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?('Spot')
p ages.key?('Spot')
p ages.has_key?('Spot')
p ages.member?('Spot')

# question 2
# Convert the string in the following ways (code will be executed on original munsters_description below):
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munster_description = "The Munsters are creepy in a good way."
p munster_description.swapcase
p munster_description.capitalize
p munster_description.downcase
p munster_description.upcase

# question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# question 4
# See if the name 'Dino' appears in the string below
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('Dino')
p advice.include?('life')
p advice.match?('Dino')

# question 5
# show an easier way to write this array
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
p flintstones

# question 6
# How can we add the family pet "Dino" to our usual array:

flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
flintstones.push('Dino')

# question 7
# add Dino and Hoppy to the array in one command
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.insert(-1, 'Dino', 'Hoppy')
p flintstones

# question 8
# Shorten the following sentence. 
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(0..25)
p advice.slice!(0, advice.index('house'))
p advice

# question 9
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
p statement.count('t')

# question 10
# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a table of Flintstone family members that was forty characters in
# width, how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
print title.center(40)