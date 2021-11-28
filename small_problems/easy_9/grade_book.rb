# # Grade Book

# Write a method that determines the mean (average) of the three scores passed to
#  it, and returns the letter value associated with that grade.

#  Numerical Score Letter	Grade
#  90 <= score <= 100	'A'
#  80 <= score < 90	'B'
#  70 <= score < 80	'C'
#  60 <= score < 70	'D'
#  0 <= score < 60	'F'

# **Rules/Requirements**

# *Input*:3 integers
# *Output*: a string

# *Explicit*: 
# - all given integers will be between 0 and 100
# - no need to check for negative grades or grades higher than 100


# *Implicit*: 

# *Questions:*
# - will the input numbers always be integers, and does it even matter?

# **Examples/Test Cases**

# ```ruby
# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"
# ```

# **Data Structure**

# Initial: integers
# Intermediate: hash, array, helper function to calculate average
# Return: a tring (1 chracter)

# **Algorithm**

# *Calculate an average from numbers that are passed in as arguments, and return
# a letter grade character, indiciating a range of grade numbers, that this grade
# number falls in*

# - create helper function to calcuate the average of any number of numbers passed 
# in as an argument
#   - *calculate_average(*scores)
#     - add up all the number scores passed in, and divide them by the number of 
#     scores. Return this result.
# - Create a hash that has grade letters as the keys, and ranges as the values
#   - { A: (90..100), B: (80..89), etc}
# - assign variable `average` to the result of passing in the given arguments to 
# the `calculate_average` function
# - Find where `average` appears in the grade hash as a value, and return it's associated
# key



# **Code Implementation**

GRADE_LETTER_MAP = {
  A: (90..100),
  B: (80..89), 
  C: (70..79),
  D: (60..69),
  F: (0..59)
}

def calculate_average(*scores)
  scores.flatten!
  scores.sum / scores.size
end

def get_grade(*grades)
  grade_average = calculate_average(grades)
  GRADE_LETTER_MAP.values.each do |grade_range|
    if grade_range.include?(grade_average)
      return GRADE_LETTER_MAP.key(grade_range).to_s
    end
  end
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"
