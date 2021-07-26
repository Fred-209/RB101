# How old is Teddy?

# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

def print_teddys_age
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end

puts "Initial program results:"
print_teddys_age()

# Further exploration: 
# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

def print_teddys_age_2
  print "What is your name?: "
  name = gets.chomp.strip
  name = 'Teddy' if name.empty?

  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

print_teddys_age_2

