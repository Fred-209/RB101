# #Leap Years 2

# For this second version, add in the requirement to check use the Gregorian calendar if the given year is 1752 or later, or the Julian Calendar if it's not. In the Julian Calendar, any year divisible by 4 is considered a leap year. Use the following rules for the Gregorian version: 

#  In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

# **Rules/Requirements**

# *Input*: an integer > 0
# *Output*: boolean

# *Explicit*: 
# - a leap year is determined if the year is evenly divisible by 4
#   - Its not a leap year if its also divisible by 100
#   - If its divisible by 4, but not 100, yet it is evenly divisible by 400 then it IS a leap year. 
# - The given year will be greater than 0
# - Must return `true` if year is a leap year, `false` otherwise

# *Implicit*: 

# *Questions*: 

# **Examples**

# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# Julian Test Cases
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true

# **Data Structure**

# **Algorithm**

# - Input year mod 4 needs to equal 0
#   - Return true unless the year mod 100 is also true
#   - If both year mod 4 and mod 100 are true, return false unless year mod 400 is also true
  
  
def leap_year?(year)
  even_div_4 = year % 4 == 0
  even_div_100 = year % 100 == 0
  even_div_400 = year % 400 == 0

  if even_div_4 && year < 1752
    true
  else
    if even_div_400
      true
    elsif even_div_100
      false
    else 
      even_div_4
    end

  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

#  Version that checks for most common cases first, ie: evenly divisible by 4

def leap_year_mod(year)
  even_div_4 = year % 4 == 0
  even_div_100 = year % 100 == 0
  even_div_400 = year % 400 == 0

  even_div_4 && (!even_div_100 || even_div_400)
end