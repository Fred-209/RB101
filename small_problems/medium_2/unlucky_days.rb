# # Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given by 
# an argument. You may assume that the year is greater than 1752 (when the United
#  ingdom adopted the modern Gregorian Calendar) and that it will remain in use
# or the foreseeable future.

# **Rules/Requirements**

# *Input*: integer (4 digit year)
# *Output*: Integer

# *Explicit*: 
# - return the number of fri 13ths in a given year (integer)
# - the year given will always be greater than 1752

# *Implicit*: 

# *Questions:*

# **Examples/Test Cases**

# ```ruby
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
# ```

# **Data Structure**

# Initial: integer
# Intermediate: array, or date object 
# Return: integer

# **Algorithm**
# *Find out many times the 13th of a month, in a given year, falls on a friday*
# - create `friday_13ths_total` and assign to 0
# - Create a loop to run 12 times, from 1 to 12
#   - Create a Date object for the 13th day of the current loop iteration as the month number and the 
#   given year as the year #Date.new(year, month, day)**
#   - If the current day is  friday, increment `friday_13ths_total` by 1
# - return `friday_13ths_total``


# ### create date object for the 13th of a given month
# - Date.new(2003, 5, 13 - creates a Date object that represents May 13, 2003

# **Code Implementation**
require 'date'

# def friday_13th(year)
#   friday_13ths_total = 0
#   (1..12).each do |month|
#     thirteenth_day = Date.new(year, month, 13)
#     friday_13ths_total += 1 if thirteenth_day.friday?
#   end
#   friday_13ths_total
# end

# One liner
def friday_13th(year)
  (1..12).select { |month| Date.new(year, month, 13).friday?}.count
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Count the number of months in a year that have 5 fridays
- assign `num_months_with_five_fridays` to 0
- Iterate over an array of months, 1-12
  - 