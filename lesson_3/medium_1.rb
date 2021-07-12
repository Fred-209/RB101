# question 1
# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line 
# indented 1 space to the right:
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!
# One line
# Prints phrase 10x , each one on a separate line
# every time the phrase is printed, it is indented one space to the right compared to the previous printing

10.times { |number| puts (' ' * number) + "The Flintstones Rock!" }

# question 2

# the result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
# The error is due to trying to add an integer to a string
# You could call the to_s method on the (40 + 2) like
puts "the value of 40 + 2 is " + (40 + 2).to_s
# or you could use string interpolation ala 
puts "the value of 40 + 2 is #{40 + 2}."

# question 3
def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# What is the purpose of the number % divisor == 0 ? 
# This is the modulo operator, and it is testing to see if there is any remainder left from 
# dividing the original number and another number. If there is a remainder that is not 0,
# then that means that 'number' is not a factor of the 'divisor', because number cannot be
# divided evenly by the divisor

# What is the purpose of the line that just says 'factors'?
# The purpose is to return this value 'factor'


# question 4
#  The << operator will mutate the original array, if 'buffer' happens to exist as a local variable
# in the main scope, outside of the method definition. the '+' will not as it returns a new array instead
# of altering the original

# question 5
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the 
# sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The 'limit' variable is outside the scope of the method definition. 'limit' needs to be passed in
# as an argument for the method definition to see it. 

# question 6
# What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# the output is 34

# question 7
# One day Spot was playing with the Munster family's home computer and he wrote a
# small program to mess with their demographic data

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# He then typed the following code:
mess_with_demographics(munsters)

# I dont believe it will alter the original hash, because the .each method is non mutating, so 
# a new hash is being returned by the mess_with_demographics method. The original 'munsters' hash 
# is not altered.
# Turns out the original hash WILL be altered because the Hash#[]= method (element assignment) is beinv
# invoked and this will alter the data that is using the hash value name as its pointer

# question 8

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

