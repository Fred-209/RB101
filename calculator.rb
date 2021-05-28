# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  puts("=>" + message)
end

def valid_number?(num)
  num.to_i() != 0
end

def valid_operator?(opr)
 opr.match?(/[1234]/)
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi, #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("That is not a valid number. Try again.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("That is not a valid number. Try again.")
    end
  end

  operator_prompt =
  <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG


  puts operator_prompt
    
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if valid_operator?(operator)
      break
    else 
      prompt("#{operator} is not a choice. Please choose 1, 2, 3, or 4")
    end
  end


  result = case operator 
          when '1'
            result = number1.to_i + number2.to_i
          when '2'
            result = number1.to_i - number2.to_i
          when '3'
            result = number1.to_i * number2.to_i
          when '4'
            result = number1.to_f / number2.to_f
          end


  prompt("The result is #{result}.")

  prompt(" Do you want to perform another calculation? (Y for yes")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator!")