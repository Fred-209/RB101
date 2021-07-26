# How big is the room?

# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

def print_area_of_room
  ft_per_meter = 10.7693

  print "What is the length of the room in meters?: "
  length = gets.chomp.to_f
  print "What is the width of the room in meters?: "
  width = gets.chomp.to_f

  area_in_meters = length * width
  area_in_ft = area_in_meters * ft_per_meter

  puts "The area of the room is #{area_in_meters} square meters " \
    "(#{area_in_ft.round(2)} square feet)."
end

# print_area_of_room()

# Further Exploration: 

# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

INCHES_PER_FT = 12
CM_PER_INCHES = 2.54

print "What is the length of the room in feet?: "
length_ft = gets.chomp.to_f

print "What is the width of the room in feet?: "
width_ft = gets.chomp.to_f

sq_feet = length_ft * width_ft
sq_inches = sq_feet * INCHES_PER_FT
sq_centimeters = sq_inches * CM_PER_INCHES

puts "The area of the room is #{sq_feet} feet. (#{sq_inches} inches, " \
     "#{sq_centimeters} centimeters)."

