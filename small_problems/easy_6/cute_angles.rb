# # Cute Angles

# **Rules/Requirements**

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.


# *Input*: a float
# *Output*: a string

# *Explicit*: 
# - use DEGREE = "\xC2\xB0" to represent the degree symbol
# - Use a single quote to represent minutes
# - Use a double quote to represent seconds
# - A degree has 60 minutes, a minute has 60 seconds
# - Use 2 digit numbers with leading zeroes when formatting the minutes and seconds e.g., 321°03'07"


# *Implicit*: 
# - The degree will stay the same, the whole number to the left of the decimal point
# - The minutes are calculated by multiplying the decimal portion of the given float by 60, then taking the whole number of that as the minutes
# - To find the seconds, you multiply the decimal portion found when obtaining the minutes by 60. 



# **Examples/Test Cases**
# ```ruby
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# ```

# **Data Structure**

# **Algorithm**

# - assign constant `DEGREE` to "\xC2\xB0" for the degree symbol
# - Get the degree and minutes from the given float
#   - float divmod(1) will give the divisor and remainder, the remainder is the decimal form of the minutes
#   - Multiply this decimal form of minutes by 60 , and the number to the left of the decimal place of this result, is the minutes. 
#     - The decimal portion will rep the decimal seconds. Multiply this by 60 to get seconds


DEGREE = "\xC2\xB0"

def dms(angle)
  deg, minutes_decimal = angle.divmod(1)
  minutes_decimal *= 60
  minutes, seconds_decimal = minutes_decimal.divmod(1)
  


  # minutes, sec_decimal = (min_decimal * 60).divmod(1)
  # seconds = (sec_decimal * 60).to_i
  p deg
  p minutes_decimal
  p "minutes are " + minutes.to_s
  
  # p minutes
  # p seconds
  
end

dms(30)
dms(76.73)
dms(254.6)
dms(93.034773)
dms(0)
dms(360)