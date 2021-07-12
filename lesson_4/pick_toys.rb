toys = {
  'Woody'          => 'Toy Story',
  'Optimus Prime'  => 'Transformers',
  'Cobra'          => 'G.I. Joe',
  'Buzz Lightyear' => 'Toy Story',
  'Teela'          => 'He-Man',
  'Lil Bo Peep'    => 'Toy Story',
  'Beeguy'         => 'Transformers'
}


def select_toys(toy_list)
  keys_list = toy_list.keys
  selected_toys = {}
  counter = 0

  loop do
    break if counter == keys_list.size
    current_key = keys_list[counter]
    current_value = toy_list[current_key]

    if current_value == 'Transformers'
      selected_toys[current_key] = current_value
    end

    counter += 1
  end

  selected_toys
end

p select_toys(toys) 








# Select only the toys who are Transformers

# input: a hash
# output: an array

# Algorithm: 
# 1. Initialize an empty array 'selected_toys'
# 2. set 'counter' to 0
# 3. Extract all the keys of the toys hash to variable named 'keys_list'
# 4. Set the 'current_key' variable to the element from the 'keys_list' that counter is equal to, 0 in this case to start
# 5. Set the 'current_value' variable equal to the value referenced in the given input hash with the 'current_key'
# 5. Check to see if the 'current_value'  value is equal to 'Transformers'
#   - If it is, add 'current_value' to the 'selected_toys' array
# 6. Increment counter by 1
# 7. Repeat steps 4 - 6 until the entire 'keys_list' hash has been iterated over
#   - This will be determined when the 'counter' variable is equal to the size of the 'keys_list' array

