# # 1000 Lights

# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row of
#  switches and toggle every one of them. You go back to the beginning, and on 
#  this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
#  you go back again to the beginning and toggle switches 3, 6, 9, and so on.
#   You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns
#  an Array that identifies which lights are on after n repetitions.




# **Rules/Requirements**

# *Input*: integer
# *Output*: array

# *Explicit*: 
# - the given integer represents the number of passes to make over the 'switches' 
# of lights
# - all of the switches are initially turned off
# - the first pass you always toggle every switch, turning them all on
# - the switches number from 1 to the given integer `n`
# - You complete `n` repetitions/passes where `n` is the given integer


# *Implicit*: 
# - on each pass, you are starting at the switch that is equal to the number of the pass
# you're on, and you also skip this number of lights/switches when iterating


# *Questions:*

# **Examples/Test Cases**

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# **Data Structure**

# Initial: integer
# Intermediate: 
# - range (1..given integer)
#   - this is the number of lights/switches
#   - maybe converted to an array
# - maybe create a hash with the each light number as a separate key, and the values for
# each one can either be 0 or 1

# Return: an array that consists of all light numbers that were left on at the end
# of the last repetition

# **Algorithm**

# ** Create a hash that consists of all numbers from 1 through the given integer as the keys, 
# and all values initially set to `0`. Iterate over a range of numbers from 1 through the given integer.
# For each iteration, start at the hash key found at the current range number iteration, and toggle its 
# 0/1 value to the opposite. THis range iteration needs to step up by the number of the current repetition.
# Once the range has finished iterating X number of times (is is the given integer), return the keys 
# from the hash that have 1 as their value. Return this in an array form**

# - Create a hash made up of keys that start at 1 as the first, and last key is 
# the given integer
#   - Set all values of these keys to 0
# - Initialize `repetition_count` variable to 1
# - Start a loop to execute `n` times (given integer)
#   - Iterate over a range of numbers from (outer loops repetion number) through `n` by step of 
#   `repetition_count`
#     - toggle the value from 0 to 1 (or vice versa) that is found in the created hash**
#     with the current inner loop's iteration number as the key
    # - increment `repetition_count` by 1
# - Create an array that consists of all keys from this created hash that have values of 1**
# - return this created array `lights_left_on`


# ** toggle 1/0
# - If the value for the given key in the created has is 0, reassign the value to be 1. 
# If it starts off as 1, reassign the value to be 0

# **Create an array that consists of all keys from this created hash that have values of 1
# - create empty array `lights_left_on`
# - Iterate over the created hash
#   - If current value is 1, add current key to `lights_left_on` array






# **Code Implementation**

def lights_left_on(total_switches)
  switch_bank = (1..total_switches).to_a.to_h { |light_number| [light_number, 0]}
  
  repetition_count = 1
  total_switches.times do |_|
    repetition_count.step(by: repetition_count, to: total_switches) do |switch_number|
      if switch_bank[switch_number].zero? 
        switch_bank[switch_number] = 1
      else
        switch_bank[switch_number] = 0
      end
    end
    repetition_count += 1 
  end  
  
  light_numbers_still_on = []
  switch_bank.each_pair do |light_number, toggle|
    light_numbers_still_on << light_number if toggle == 1
  end
  light_numbers_still_on
end

p lights_left_on(1000)



