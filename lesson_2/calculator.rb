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
  if num == '0'
    true
  else
    num.to_i() != 0
  end
end

def valid_operator?(opr, num2)
  if num2 == '0' && opr == '4'
    'div_by_zero'
  else
    %w(1 2 3 4).include?(opr)
  end
end
prompt("Welcome to Calculator! Enter your name:")

def operator_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# get user name
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

  number2 = 'test'
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
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

    case valid_operator?(operator, number2)
    when true
      break
    when 'div_by_zero'
      prompt("You cannot divide a number by 0.")
      prompt("Choose a different operator (1, 2, 3, 4)")
    when false
      prompt("#{operator} is not a valid choice. Please choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operator_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}.")

  prompt(" Do you want to perform another calculation? (Y for yes)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator!")
