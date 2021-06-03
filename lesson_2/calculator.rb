# ask the user for their chosen language, english or spanish
# set a flag indicating their chosen language
# make sure that all messages pulled from the yaml file are specific to their chosen language

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE_OPTIONS = ['en', 'es']

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

def operator_to_message(op, lang)
  word = case op
         when '1'
           MESSAGES[lang]['adding']
         when '2'
           MESSAGES[lang]['subtracting']
         when '3'
           MESSAGES[lang]['multiplying']
         when '4'
           MESSAGES[lang]['dividing']
         end
  word
end

prompt(MESSAGES['choose_language'])

lang_choice = ''
loop do
  lang_choice = gets.chomp.downcase
  if LANGUAGE_OPTIONS.include?(lang_choice)
    break
  else
    prompt(MESSAGES['invalid_lang_choice'])
  end
end

prompt(MESSAGES[lang_choice]['get_name'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES[lang_choice]['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES[lang_choice]['greet']} #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES[lang_choice]['first_number'])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES[lang_choice]['invalid_number'])
    end
  end

  number2 = 'test'
  loop do
    prompt(MESSAGES[lang_choice]['second_number'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES[lang_choice]['invalid_number'])
    end
  end

  puts MESSAGES[lang_choice]['operator_prompt']

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    case valid_operator?(operator, number2)
    when true
      break
    when 'div_by_zero'
      prompt(MESSAGES[lang_choice]['div_by_0'])
    when false
      prompt("#{operator} #{MESSAGES[lang_choice]['invalid_operator']}")
    end
  end

  prompt(operator_to_message(operator, lang_choice))
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

  prompt("#{MESSAGES[lang_choice]['result']} #{result}")

  prompt(MESSAGES[lang_choice]['another_calculation?'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES[lang_choice]['thank_you'])
