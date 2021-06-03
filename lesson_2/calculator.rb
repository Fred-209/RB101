# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  puts("=> " + message)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def valid_operator?(opr, num2)
  if ( (num2 == '0.0' || num2 == '0') && (opr == '4') )
    'div_by_zero'
  else
    %w(1 2 3 4).include?(opr)
  end
end

def operator_to_message(op)
  word = case op
         when '1'
           MESSAGES['adding']
         when '2'
           MESSAGES['subtracting']
         when '3'
           MESSAGES['multiplying']
         when '4'
           MESSAGES['dividing']
         end
  word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES['greet']} #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = 'test'
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  puts MESSAGES['operator_prompt']

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    case valid_operator?(operator, number2)
    when true
      break
    when 'div_by_zero'
      prompt(MESSAGES['div_by_0'])
    when false
      prompt("#{operator} #{MESSAGES['invalid_operator']}")
    end
  end

  prompt(operator_to_message(operator))
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

  prompt("#{MESSAGES['result']} #{result}")

  prompt(MESSAGES['another_calculation?'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
