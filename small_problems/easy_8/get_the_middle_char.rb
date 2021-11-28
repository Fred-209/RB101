# # Get The Middle Character

# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length, you 
# should return exactly one character. If the argument has an even length, you 
# should return exactly two characters.

# **Rules/Requirements**

# *Input*: a string
# *Output*: a string

# *Explicit*: 
# - The string will not be empty
# - return the middle chracters from the string
# - If string length is even, return 2 characters. Return 1 character if string lenghth
#   is odd


# *Implicit*: 
# - If string length is just one or two, return those characters
# - The middle character in an odd length string can be found by dividing the length
# of the string by 2.
# - In an even length string, the middle 2 characters would be found by dividing 
# the length of the string by two, and also one character to the right of this one

# *Questions:*
# - Do spaces count as a character?
#   - Looking at test cases, yes they do. 
# **Examples/Test Cases**

# ```ruby
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'
# ```

# **Data Structure**

# Initial: string
# Intermediate: posibbly an array of chracters from the string
# Return: a string

# **Algorithm**

# *Single out the middle character(s) from a given string and return them*
# - calculate the length of the given string
# - divide the length by two to get the character position
# - return the character found at this position from above if the length is odd
# - return the character before the character found at index position of length /2 
# (length / 2) - 1 ,the successive character
# -


# **Code Implementation**

def center_of(str)
  if str.length.odd? 
    str[str.length / 2]
  else
    str[(str.length / 2) -1] + str[(str.length / 2)]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'