# # After Midnight (Part 2)

# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.


# **Rules/Requirements**

# *Input*: A string, representing time in 24 hour format
# *Output*: an integer, (number of minutes before or after midnight)

# *Explicit*: 
# - Do not use ruby's `Date` or `Time` methods
# - The return value from each method should fall within the range of 0..1439
# - Disregard daylight savings time and other irregularities.


# *Implicit*: 
# - What defines midnight on 24 hour time?
#   - 2400 is midnight
# - If figuring out the time for after_midnight, the answer should just be
#   the given time in 24 hour format converted into its number of minutes since 0
# - For before_midnight, this number of minutes would need to be subtracted from 1440 since 1440 would be considered midnight , 



# **Examples/Test Cases**
# ```ruby
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# ```

# **Data Structure**

# **Algorithm**

# - assign constant variables:
#   - MIN_IN_HOUR to 60
#   - MIN_IN_DAY to 1440

#   - Create helper method `get_total_minutes` to extract the number of minutes total that have passed, from the given 24 hour time

#     - *get_total_minutes(time)
#       - Convert the given string, representing a time in 24 hour time, to 2 integers that represent the hours and minutes
#       - variables `hours` and `minutes` equal to the result of splitting the given string into an array of 2 elements, using a colon : as the delimiter for the split
#       - Convert `hours` and `minutes` into integers
#       - Assign `total_minutes` to the result of multiplying `hours` by MIN_IN_HOUR 
#       - Increment `total_minutes` by `minutes`
#       - Return `total_minutes`

# *after_midnight(time)*

# - Return `0` if the given argument is equal to '24:00'
# - Set variable `total_minutes` equal to the result of calling `get_total_minutes`, passing in the given `time` as the argument
# - Return `total_minutes`


# *before_midnight(time)*

# - Return `0` if the given argument is equal to '24:00'
# - Set variable `total_minutes` equal to the result of calling `get_total_minutes`, passing in the given `time` as the argument
# - Assign `minutes_before_midnight` to the result of the expression MIN_IN_DAY - `total_minutes`
# - Return `minutes_before_midnight`

# MIN_IN_HOUR = 60
# MIN_IN_DAY = 1440

# def get_total_minutes(time)
#   hours, minutes = time.split(":")
#   total_minutes = hours.to_i * MIN_IN_HOUR
#   total_minutes += minutes.to_i
#   total_minutes
# end

# def after_midnight(time)
#   return 0 if time == '24:00' || time == '00:00'

#   total_minutes = get_total_minutes(time)
#   total_minutes
# end

# def before_midnight(time)
#   return 0 if time == '24:00' || time == '00:00'

#   total_minutes = get_total_minutes(time)
#   minutes_before_midnight = MIN_IN_DAY - total_minutes
#   minutes_before_midnight
# end


# Using Time class

# **ALGORITHM**

# - require the 'time' class
# - *after_midnight(time_str)*
#   - 

require 'time'

MIN_IN_HOUR = 60
MIN_IN_DAY = 1440

def after_midnight(time_str)
  hours, minutes = Time.parse(time_str).hour, Time.parse(time_str).min
  (hours * MIN_IN_HOUR + minutes) % MIN_IN_DAY
end

def before_midnight(time_str)
  total_minutes = after_midnight(time_str)
  return 0 if total_minutes == 0
  MIN_IN_DAY - total_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0