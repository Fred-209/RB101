# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.length + 2)}+"
#   empty_line = "|#{' ' * (message.length + 2)}|"

#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# Version where message is truncated to fit inside the box within an 80 char limit screen

def print_in_box_truncated(message)
  trunc_msg = message[0..75]
  horizontal_rule = "+#{'-' * (trunc_msg.length + 2)}+"
  empty_line = "|#{' ' * (trunc_msg.length + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{trunc_msg} |"
  puts empty_line
  puts horizontal_rule  
end


print_in_box_truncated('To boldly go where no one has gone before.')
print_in_box_truncated('')
print_in_box_truncated('Once upon a time in a galaxy far, far away')
print_in_box_truncated('I am the walrus.')

print_in_box_truncated('******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************')

# set_border_rules helper method
def set_border_rules(msg_length)
  if msg_length > 76
    horizontal_rule = "+#{'-' * 78}+"
    empty_line = "|#{' ' * 78}|"
  else
    horizontal_rule = "+#{'-' * (msg_length + 2)}+"
    empty_line = "|#{' ' * (msg_length + 2)}|"
  end
  [horizontal_rule, empty_line]
end

def print_in_box_wrapped(message)
  message_array = message.scan(/.{1,76}/)
  horizontal_rule, empty_line = set_border_rules(message.length)
  
  puts horizontal_rule
  puts empty_line
  message_array.each do |sub_msg|
    puts "| #{sub_msg.center(message_array[0].length)} |"
  end
  puts empty_line
  puts horizontal_rule
end

print_in_box_wrapped('To boldly go where no one has gone before.')
print_in_box_wrapped('Once upon a time in a galaxy far, far away')
print_in_box_wrapped('I am the walrus.')
print_in_box_wrapped('******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************')
print_in_box_wrapped('')

# **Problem**
# - If the given string is over 80 characters long, break it down into sub-messages that are 80 characters or less in length
#   - msg_array = message.scan(/.{0,80}/)
# - Print these messages, in order line by line, to the screen within the framework of my print_in_box_wrapped instructions
#   - Iterate over msg_array
#     - print each element to the screen, on its own line with a '|' on both ends and padded with the appropriate amount of space to equal 2 more than the length of the original message length
    


