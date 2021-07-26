# Palindromic Strings part 1

# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
  reversed_string = ''
  temp_string = string.clone

  until temp_string == ''
    reversed_string += temp_string.slice!(-1)
  end
  
  string == reversed_string
end

p palindrome?('madam') # ==  true
p palindrome?('Madam')  #==  false  # (case matters) 
p palindrome?("madam i'm adam")  #==  false  # (all characters matter) 
p palindrome?('356653')  ==  true

# Another method 
def palindrome?(string)
  string_array = string.chars
  rev_array = []
  string_array.reverse_each { |char| rev_array.push(char)}

  rev_array.join == string
end





# Using String#reverse
def palindrome?(string)
  string == string.reverse
end

# This also works for array

def palindrome?(string_or_array)
  string_or_array == string_or_array.reverse
end



