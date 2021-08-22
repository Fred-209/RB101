# # Practice Problem 16

# # A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# # It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# # Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# # It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# # Write a method that returns one UUID when called with no parameters.

# **RULES/REQUIREMENTS**

# *Input*: No input
# *Output*: a string

# - The returned should consist of 36 total characters
# - The format of the characters in the string should follow "8-4-4-4-12"
#   - The number of characters broken up by dashes
# - The possible range of characters being returned are any of the digits 0-9 and any letters of 'a' - 'f', hexidecimal
# - This should be generated randomly

# **EXAMPLES/TEST CASES**

# `create_UUID() #=> "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"`

# **ALGORITHM**
# - Create method `create_UUID` with no parameters
#   -assign variable `HEXI_RANGE` to an array of that contains all letters a-f and all characters "0" - "9", not integers
#     - Convert the range string characters "0" - "9" to an array
#     - convert the range 'a'-'f' to an array
#     - add these two together and assign to the variable 'HEXI_RANGE'
#   - create the constant `PATTERN` and assign it to the array `[8, 4, 4, 4, 12]# `
#   - create an empty array `uuid_array`
#   - Iterate over PATTERN, using `number` as the parameter
#     - create an array of a random sampling of `number` amount of characters from `HEXI_RANGE`
#     - join these characters together with no spaces
#     - add this group of joined characters as an element in the array `uuid_array`
#     - Repeat these steps for every element in PATTERN
#   - Join the elements of `uuid_array` together as a string, with a dash '-' separating them,  and save this string as `uuid`
#   - Return `uuid`

HEXI_RANGE = ('0'..'9').to_a + ('a'..'f').to_a
PATTERN = [8, 4, 4, 4, 12]

def create_UUID
  uuid_array = []

  PATTERN.each do |number|
    uuid_array << HEXI_RANGE.sample(number).join
  end

  uuid = uuid_array.join('-')
  uuid
end

p create_UUID()
p create_UUID()



