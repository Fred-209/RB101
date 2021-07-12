# Easy 1

# question 3
# Replace the word 'important'  with 'urgent' in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')
puts advice

# question 5
# Programmatically determine if 42 lies between 10 and 100.
puts (10...100).cover?(42)

# question 6
# show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

#third way
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

# question 7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!
p flintstones

# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.assoc('Barney')
p flintstones