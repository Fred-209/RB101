# # Delete Vowels

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# **Rules/Requirements**

# *Input*: an array of strings
# *Output*: an array of strings, modified

# *Explicit*: 
# - return the same array of strings with string elements modified to have vowels removed (aeiou)


# *Implicit*: 

# - Remove both upper and lower case vowels according to the test cases

# **Examples/Test Cases**
# ```ruby
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# ```

# **Data Structure**

# **Algorithm**

# - Iterate over the array using transformation:
#   - for each element, delete any instances of the chars aeiou and return the result as a transformed element
# - Return the transformed array

# def remove_vowels(str_array)
#   str_array.map! { |string| string.delete("aeiouAEIOU")}
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
# p remove_vowels(%w(green YELLOW black white))
# p remove_vowels(%w(ABC AEIOU XYZ))

# Using nested iteration and the Array#partition method

VOWELS = "aeiouAEIOU"

def remove_vowels(str_array)
  str_array.map do |string|
    string.chars.partition { |letter| !VOWELS.include?(letter)}[0].join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ))