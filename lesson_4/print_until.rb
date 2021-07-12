# Given the array of several numbers below, use an until loop to print each number.

# numbers = [7, 9, 13, 25, 18]

# Expected output:

# 7
# 9
# 13
# 25
# 18

# ** Rules/Requirements**

# Input: an array of integers, specifically [7, 9, 13, 25, 18]
# Output: integers printed to the console

# Rules: 
#   - Must use an until loop
#   - print each number to the console

# **Examples/Test Cases**

# The output should be exactly:
# 7
# 9
# 13
# 25
# 18

# **Data Structure**

# An array, being iterated over by an *until* loop

# Algorithm

# Overal: 
#   - Start an until loop and set it to iterate over an array, printing a        different element out on each iteration, until all the integers have 
#   been printed out that are contained in the *numbers* array. 
#   - Then terminate the loop

#   1. Initialize a variable *count* to 0
#   2. Start an Until loop with the condition that it ends when count > 5
#   3. Print out the element from the *numbers* array that has the index of       'count'
#   4. Increment 'count' by 1
#   5. Loop starts over

#   Implementation: 

#   count = 0
#   until count > 5
#     puts numbers[count]
#     count += 1
#   end

numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.length
  puts numbers[count]
  count += 1
end



  