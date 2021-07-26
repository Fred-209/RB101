# Even Numbers

# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

num = 2

until num > 99
  puts num
  num += 2
end

(1..99).each { |num| puts num if num.even?}

num_array = (1..99).select { |num| num % 2 == 0}
puts num_array