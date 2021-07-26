# When Will I Retire?

 # Build a program that displays when the user will retire and how many years she has to work till retirement.

def get_current_age
  print "What's your age?: "
  age = gets.chomp.strip
  
  until valid_age?(age)
    puts "Age must be an integer greater than or equal to 1."
    print "Try again: "
    age = gets.chomp.strip
  end

  age.to_i
 end

def get_retirement_age
  print "At what age would you like to retire?: "
  retirement_age = gets.chomp.strip

  until valid_age?(retirement_age)
    puts "Age must be an integer greater than or equal to 1."
    print "Try again: "
    retirement_age = gets.chomp.strip
  end

  retirement_age.to_i
end

def print_retirement_info(this_year, retire_year, years_to_go)
  puts
  puts "It's #{this_year}. You will retire in #{retire_year}."
  puts "You have only #{years_to_go} years of work to go!"
end

def valid_age?(age)
  age.to_i.to_s == age && age.to_i >= 1
end

current_age = get_current_age()
retirement_age = get_retirement_age()
age_difference = retirement_age - current_age
current_year = Time.now.year
retirement_year = age_difference + current_year
print_retirement_info(current_year, retirement_year, age_difference)
 


