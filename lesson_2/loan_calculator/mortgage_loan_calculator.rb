# mortgage_loan_calculator.rb
# mortgage_calculator_msgs.yml for messages
# Calculates a monthly mortgage payment when given the total loan amount, APR,
# and loan duration

require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_msgs.yml')
LANGUAGES_AVAILABLE = ['en', 'es']

#--------------METHOD DEFINITIONS----------------------------------------------

def another_calculation?(language)
  print language['another_calculation']
  choice = choose_y_or_n(language)
  choice == 'y'
end

def calculate_monthly_payment(loan_amt, monthly_int_rate, months, years)
  if months == 0.0
    months = years * 12
  end
  if monthly_int_rate == 0.0
    loan_amt / months
  else
    loan_amt * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-months)))
  end
end

def choose_language
  puts(MESSAGES['en_or_es'])
  language_choice = ''
  confirmed = false

  loop do
    prompt('en/es')
    language_choice = gets.chomp.downcase.strip
    if LANGUAGES_AVAILABLE.include?(language_choice)
      confirmed = confirm_language_choice(language_choice)
      return language_choice if confirmed
      choose_language()
      return language_choice
    else
      puts MESSAGES['invalid_language']
    end
  end
end

def choose_y_or_n(language)
  choice = ''
  loop do
    prompt('y/n')
    choice = gets.chomp.downcase.strip
    break if ['y', 'n'].include?(choice)
    puts language['invalid_y_or_n']
  end

  choice
end

def confirm_language_choice(lang_choice)
  puts "You chose to continue in #{MESSAGES[lang_choice]['full_name']}."
  puts MESSAGES['are_you_sure?']
  confirm_choice = choose_y_or_n(lang_choice)
  confirm_choice == 'y'
end

def clear_screen
  system('clear')
end

def display_intro(language)
  puts language['intro']
end

def display_monthly_payment(payment, language)
  puts
  puts "#{language['monthly_payment']} $#{payment.round(2)}"
  puts
end

def display_outro(language)
  print language['outro']
end

def display_progress_bar(language)
  print language['calculate_payment']
  gets
  print language['calculating']

  counter = 0
  until counter == 20
    print '.'
    sleep(0.1)
    counter += 1
  end

  print language['calculation_complete']
  gets
end

def display_recap(language, loan_amount, apr_percent, loan_duration_msg)
  puts
  puts language['recap']
  puts "#{language['total_loan']} $#{loan_amount.round}"
  puts "#{language['apr']} #{apr_percent}%"
  puts loan_duration_msg
  puts
end

def get_apr_percent(language)
  print language['get_apr']
  apr = ''

  loop do
    prompt
    apr = gets.chomp.strip
    break if zero_or_positive?(apr)
    puts language['must_be_number']
  end

  apr.to_f
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

def get_loan_amount(language)
  print language['get_loan_amount']
  loan = ''

  loop do
    prompt
    loan = gets.chomp.strip
    break if loan.to_f.positive?
    puts language['must_be_number']
  end

  loan.to_f
end

def get_loan_duration_type(language)
  puts language['months_or_years']
  duration_type = ''

  loop do
    prompt('(m/y)')
    duration_type = gets.chomp.downcase.strip
    break if duration_type == 'm' || duration_type == 'y'
    puts language['m_or_y']
  end

  duration_type
end

def get_loan_length(type, language)
  if type == 'm'
    months = get_loan_months(language)
    years = 0.0
  else
    years = get_loan_years(language)
    months = 0.0
  end
  return months, years
end

def get_loan_months(language)
  print language['how_many_months']
  months = ''
  loop do
    prompt
    months = gets.chomp.downcase.strip
    break if months.to_f.positive?
    puts language['must_be_number']
  end

  months.to_f
end

def get_loan_years(language)
  print language['how_many_years']
  years = ''

  loop do
    prompt
    years = gets.chomp.downcase.strip
    break if years.to_f.positive?
    puts language['must_be_number']
  end

  years.to_f
end

def prompt(message = '')
  print message
  print '=> '
end

def set_loan_duration_message(duration_type, months, years, language)
  if duration_type == 'm'
    "#{language['loan_duration']} #{months} #{language['months']}"
  else
    "#{language['loan_duration']} #{years} #{language['years']}"
  end
end

def zero_or_positive?(number)
  number == '0' || number == '0.0' || number.to_f.positive?
end
#------------------------------------------------------------------------------

clear_screen()
lang_choice = choose_language()
lang_choice_messages = MESSAGES[lang_choice]

# main loop
loop do
  clear_screen()
  display_intro(lang_choice_messages)

  loan_amount = get_loan_amount(lang_choice_messages)
  loan_duration_type = get_loan_duration_type(lang_choice_messages)
  loan_duration = get_loan_length(loan_duration_type, lang_choice_messages)
  loan_months = loan_duration[0]
  loan_years = loan_duration[1]
  apr_percent = get_apr_percent(lang_choice_messages)
  apr_decimal = apr_percent / 100
  monthly_int_decimal = apr_decimal / 12
  loan_duration_message =
    set_loan_duration_message(loan_duration_type, loan_months, loan_years,
                              lang_choice_messages)
  monthly_payment =
    calculate_monthly_payment(loan_amount, monthly_int_decimal, loan_months,
                              loan_years)

  display_recap(lang_choice_messages, loan_amount, apr_percent,
                loan_duration_message)
  display_progress_bar(lang_choice_messages)
  display_monthly_payment(monthly_payment, lang_choice_messages)

  break unless another_calculation?(lang_choice_messages)
end

display_outro(lang_choice_messages)
