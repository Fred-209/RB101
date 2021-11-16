def staggered_case(string, start_with='')
  char_array = string.chars
  
  case start_with
  when 'lowercase'
    caps_lock = true
  when 'uppercase'
    caps_lock = false
  else
    if char_array[0] == char_array[0].downcase
      caps_lock = true
    else
      caps_lock = false
    end
  end
  
  char_array.map! do |character|
    caps_lock = !caps_lock
    next character unless /[a-z]/i =~ character
    caps_lock ? character.upcase : character.downcase
  end
 
  char_array.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'