produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0 
  fruits = {}

  loop do
    break if counter == produce_keys.length

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      fruits[current_key] = current_value
    end

    counter += 1
  end

  fruits
end


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# return all keys that have a value of fruit

