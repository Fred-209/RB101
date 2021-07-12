# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example: 

# repeat('Hello', 3)

# Output: 

# Hello
# Hello
# Hello

def repeat(phrase, multiplier)
   multiplier.times { |i| puts phrase}
end

repeat('Hello', 3)

