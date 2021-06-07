# mortgage_loan_calculator.rb
# mortgage_calculator_msgs.yml for messages
# Calculates a monthly mortgage payment when given the total loan amount, APR,
# and loan duration

require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_msgs.yml')
LANGUAGES_AVAILABLE = ['en', 'es']

def prompt(message = '')
  print message
  print '=> '
end

def progress_bar(language)
  counter = 0
  print language['calculating']
  until counter == 20
    print '.'
    sleep(0.1)
    counter += 1
  end
  print language['calculation_complete']
  gets
end

def get_language_choice
  prompt('en/es')
  lang_choice = gets.chomp.downcase.strip
  until LANGUAGES_AVAILABLE.include?(lang_choice)
    puts MESSAGES['invalid_language']
    prompt('(en/es)')
    lang_choice = gets.chomp.downcase.strip
  end
  lang_choice
end

def confirm_selection
  confirm = gets.chomp.downcase.strip
  until confirm == 'y' || confirm == 'n'
    puts MESSAGES['invalid_y_or_n']
    prompt
    confirm = gets.chomp.downcase.strip
  end
  confirm
end

def zero_or_positive?(number)
  number == '0' || number == '0.0' || number.to_f.positive?
end

def get_apr_percent(language)
  apr = gets.chomp.strip
  until zero_or_positive?(apr)
    puts language['must_be_number']
    print language['get_apr']
    prompt
    apr = gets.chomp.strip
  end
  apr
end

def get_loan_amount(language)
  loan = gets.chomp.strip
  until zero_or_positive?(loan)
    puts language['must_be_number']
    print language['get_loan_amount']
    prompt
    loan = gets.chomp.strip
  end
  loan
end

def get_loan_duration_type(language)
  puts language['months_or_years']
  prompt('(m/y)')
  duration_type = gets.chomp.downcase.strip

  until duration_type == 'm' || duration_type == 'y'
    puts language['m_or_y']
    prompt('(m/y)')
    duration_type = gets.chomp.downcase.strip
  end
  duration_type
end

def get_loan_length(type, language)
  if type == 'm'
    months = get_loan_months(language)
    years = 0
  else
    years = get_loan_years(language)
    months = 0
  end
  return months, years
end

def get_loan_months(language)
  print language['how_many_months']
  prompt
  months = gets.chomp.downcase.strip
  until zero_or_positive?(months)
    puts language['must_be_number']
    prompt
    months = gets.chomp.downcase.strip
  end
  puts months
  months.to_f
end

def get_loan_years(language)
  print language['how_many_years']
  prompt
  years = gets.chomp.downcase.strip
  until zero_or_positive?(years)
    puts language['must_be_number']
    prompt
    years = gets.chomp.downcase.strip
  end
  years.to_f
end

def calculate_monthly_payment(loan_amt, monthly_int_rate, loan_length)
  loan_amt * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-loan_length)))
end

system('clear')

# english or spanish
puts(MESSAGES['en_or_es'])
confirm_choice = nil
until confirm_choice == 'y'
  lang_choice = get_language_choice()
  puts "You chose to continue in #{MESSAGES[lang_choice]['full_name']}."
  puts MESSAGES['are_you_sure?']
  prompt('(y/n)')
  confirm_choice = confirm_selection()
end
lang_msg = MESSAGES[lang_choice]

# main loop
loop do
  system('clear')
  puts lang_msg['intro']

  print lang_msg['get_loan_amount']
  prompt
  loan_amount = get_loan_amount(lang_msg).to_f

  loan_duration_type = get_loan_duration_type(lang_msg)
  loan_duration = get_loan_length(loan_duration_type, lang_msg)
  loan_months = loan_duration[0]
  loan_years = loan_duration[1]

  print lang_msg['get_apr']
  prompt
  apr_percent = get_apr_percent(lang_msg).to_f

  apr_decimal = apr_percent / 100
  monthly_int_decimal = apr_decimal / 12

  if loan_duration_type == 'm'
    monthly_payment =
      calculate_monthly_payment(loan_amount, monthly_int_decimal, loan_months)
    loan_duration_msg =
      "#{lang_msg['loan_duration']} #{loan_months} #{lang_msg['months']}."
  else
    loan_months = loan_years * 12
    monthly_payment =
      calculate_monthly_payment(loan_amount, monthly_int_decimal, loan_months)
    loan_duration_msg =
      "#{lang_msg['loan_duration']} #{loan_years} #{lang_msg['years']}."
  end

  puts
  puts lang_msg['recap']
  puts "#{lang_msg['total_loan']} $#{loan_amount.round}"
  puts "#{lang_msg['apr']} #{apr_percent}%"
  puts loan_duration_msg
  puts
  print lang_msg['calculate_payment']
  gets
  progress_bar(lang_msg)
  puts "#{lang_msg['monthly_payment']} $#{monthly_payment.round(2)}"
  puts
  print lang_msg['another_calculation']
  prompt
  exit = gets.chomp.downcase.strip

  break if exit != 'y'
end
