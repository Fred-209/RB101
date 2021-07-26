# Sum or product of consecutive integers

# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

def calculate_sum(number)
  sum = (1..number).reduce(:+)
  sum
end

def calculate_product(number)
  product = (1..number).reduce(:*)
  product
end

def get_choice
  valid_choices = ['s', 'p']

  print "Enter 's' to compute the sum, 'p' to computer the product: "
  user_choice = gets.chomp.strip.downcase
  
  until valid_choices.include?(user_choice)
    print "That is not a valid choice. Enter either 's' or 'p': "
    user_choice = gets.chomp.strip.downcase
  end

  if user_choice == 's'
    return ['s', 'sum']
  else
    return ['p', 'product']
  end
end

def get_number
  print "Please enter an integer greater than 0: "
  number = gets.chomp.strip

  until valid_number?(number)
    print "That is not a valid integer. Try again: "
    number = gets.chomp.strip
  end

  number.to_i
end

def valid_number?(number)
  number.to_i.to_s == number && number.to_i >= 1
end

number = get_number()
choice = get_choice()


if choice[0] == 's'
  answer = calculate_sum(number)
else
  answer = calculate_product(number)
end

puts "The #{choice[1]} of the integers is #{answer}."





