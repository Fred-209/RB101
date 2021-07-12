# question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?
# if false
#   greeting = "hello world"
# end

# greeting
# I expect that greeting is going to return nil because when you initialize a variable inside of an IF block,
# the variable is initialized to 'nil' even if the IF block is never executed. 

# question 2
# What is the result of the last line in the code below?

# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings

# It will output the greetings hash which now contains {a: 'hi there' } because when informal_greeting
# was assigned to the greetings hash symbol :a, it is pointing to the same object that greetings is.
# So when the concatenator shovel is used to add 'there' to the end of the string, it mutates this 
# object in memory that that both greetings and informal_greeting are pointing to

# question 3

=begin

A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

Working it out:
one = 'one'
two = 'two'
three = 'three'

one = two  # one now points to a new object with the data 'two'
two = three # two now points to a new object with the data 'three'
three = one # three not points to a new object with same data that one points to, which is 'two'
# I think this code will just print out the original values that one, two, and three are assigned to because
# within the method, no variables outside of the method are altered. Assignment does not mutate the
# original object, it creates a new object with the same value


B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# same as from A), the variables outside of the method are not altered by what is going on inside of the 
mess_with_vars method. 

C) 

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# This time, the values of the top level variables one, two, and three are altered because
 the invocatioon of gsub! mutates the caller, changing the values of these variables outside of the 
 mess_with_vars method
=end 

 # Question 4

=begin
 Ben was tasked to write a simple ruby method to determine if an input string is an IP address 
 representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions.
  Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric 
  string between 0 and 255 as required for IP numbers and asked Ben to use it.
=end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end








