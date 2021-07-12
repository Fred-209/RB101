def select_letter(string, letter_choice)
  counter = 0
  selected_letters = ''

  loop do 
    break if counter == string.size
    selected_letters << string[counter] if string[counter] == letter_choice
    counter += 1
  end

  selected_letters
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

