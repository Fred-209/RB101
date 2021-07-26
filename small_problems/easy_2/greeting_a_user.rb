# Greeting a user

 # Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

def print_normal_greeting(name)
  puts "Hello #{name}."
end

def print_scream_greeting(name)
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
end


 print "What is your name?: "
 name = gets.chomp.strip

screaming = name[-1] == '!'

 screaming ? print_scream_greeting(name) : print_normal_greeting(name)

