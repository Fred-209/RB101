# Odd Numbers

# Print all odd numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

(1..99).each { |num| puts num if num.odd?}

num = 1

while num <= 99
  puts num
  num +=2 
end

num = 1

for num in (1..99)
  puts num if num % 2 == 1
end

1.upto(99) do |num|
  if num % 2 == 1
    puts num
  end
end

num_array = (1..99).select { |num| num.odd?}
puts num_array