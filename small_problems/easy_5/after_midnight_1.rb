# # After Midnight Part 1

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# **Rules/Requirements**

# *Input*: an integer
# *Output*: a string representing the time, ie: "12:05"

# *Explicit*: 
# - If given integer is positive, the time is that many minutes after midnight
# - If the given integer is negative, it's that many minutes before midnight
# - The method should work with any integer input
# - Do not use ruby's Date or Time class


# *Implicit*: 
# - 1440 minutes are in one day, so if integer is > 1400 or less than -1400, the time will need to be reset back to midnight and continue adding/subtracting



# **Examples/Test Cases**
# ```ruby
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# ```

# **Data Structure**

# **Algorithm**
# - If the given integer is over 1440 or less than -1440, I need to remove the excess days from the number of minutes so we are dealing with just the minutes from one day (1440 min in a  day). The excess day's minutes aren't needed
#   - Get the mod of the absolute value of the given integer mod 1440, save as total_minutes
# - Else, if given integer is within the range of -1440 - 1440, assign the variable name `total_minutes` to the ABS of the given integer 

# - To convert total_minutes into an hours, minutes format get the division and remainder of the ABS of total_minutes and 60,  save the division as hours and the remainder as minutes

# - IF the given integer is positive, , hours and minutes are already correct as the time, I just need to format their output in '00:00' format below
  
# - If the given integer is negative:
#   - Reassign hours to 24 - hours
#   - If minutes is > than 0, subtract 1 from hours
#   - Reassign minutes to 60 - minutes

# - Get the hours and minutes into a '00:00' format for outputting to the screen
#   - Use string formatting to accomplish this
#     - Return "%02d:%d" % [hours, minutes]

# MIN_PER_DAY = 1440

# def time_of_day(delta_min)

#   if (delta_min > MIN_PER_DAY) || (delta_min < -MIN_PER_DAY)
#     total_minutes = delta_min.abs % MIN_PER_DAY
#   else
#     total_minutes = delta_min.abs
#   end

#   hours, minutes = total_minutes.divmod(60)

#   if delta_min.negative?
#     hours = 24 - hours
#     hours -= 1 if minutes > 0
#     minutes = 60 - minutes
#   end

#   "%02d:%02d" % [hours, minutes]
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"ls


# # using Time class

MIN_PER_DAY = 1440

def time_of_day(delta_min)
  time = Time.new(0)

  if delta_min > 0
    time =  time + (delta_min % 1440) * 60
    p "#{time.hour}:#{time.min}"
  end
end

time_of_day(3000)


