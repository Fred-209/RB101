# # Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# **Rules/Requirements**

# *Input*: a integer
# *Output*: strings of astericks that form a triangle

# *Explicit*: 
# - The hypotenuse of the triangle should have one end at the lower left of the triangle, and one end at the upper right
# - The argument, `n`, is the number of *'s that should be on each of the three sides of the triangle

# *Implicit*: 
# - `n` will be the number of rows and number of columns of astericks
# - the bottom row of the triangle will be filled completely with *'s, equal to the given `n`
# - blank spaces fill in the rows except for the bottom row. 
# - The total character count for each line will be equal to `n`
# - The first line out output will have 1 asterick, and the rest will be n -1 worth of blank spaces in front 
# - 2nd line will have 2 astericks, and n-2 blank spaces, and so on all the way up to the `n`th line, which will have `n` astericks and 0 blank spaces

# **Examples/Test Cases**
# ```ruby
# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
# ```

# **Data Structure**

# **Algorithm**

# - Need to output to the screen `n` times
# - loop `n` times, keeping track of an `index`
#   Using the Integer#times method, `n`.times do |num|
# - on each iteration, `spaces` will equal n - (index + 1) and `stars` will equal `n` - spaces.
#   - assign local variable `spaces` to `num - (idx + 1)`
#   - assign local variable `stars` to `num - spaces`
#   - print out each line of `spaces` and `stars` 

#   def triangle(num)
#     num.times do |idx|
#       spaces = num - (idx + 1)
#       stars = num - spaces
#       puts ' ' * spaces + '*' * stars
#     end
#  end


# triangle(5)
# triangle(9)


#rewrite using Integer#upto, #Integer#downto, and String#rjust, ljust
def triangle(num)
  1.upto(num) { |count| puts ('*' * count).rjust(num)} #BR
  1.upto(num) { |count| puts ('*' * count).ljust(num)} #BL
  num.downto(1) {|count| puts ('*' * count).rjust(num)} #UR
  num.downto(1) {|count| puts ('*' * count).ljust(num)} #UL
end

triangle(20)

# upside down version
# - Will be the same number of stars and spaces, just in a different printed order
# - The full line of stars should be on top, while the single star line should be on bottom
# - The first line of stars will be equal to the given `num` , and have 0 spaces
# - The second line of stars will be num -1 stars, with 1 space
# - The number of spaces follows a count of 0 through num, can use index for this
# - So each iteration of the loop, spaces will be equal to index, and stars will be equal to num - spaces

# def upside_down_triangle(num)

#   num.times do |idx|
#     spaces = idx
#     stars = num - idx
#     puts (' ' * spaces) + ('*' * stars) 
#   end
# end

# upside_down_triangle(5)
# upside_down_triangle(9)

# #### High Level Overview - Corner Choice version
# # This version will let you choose which corner to print the triangle out to .
# - Your corner choices are upper-left, upper-right, lower-left, lower-right
# - Create a helper method `get_corner()` with user input choices of these 4 corners
#   - validate the input, will use numbers 1 - 4 for valid choices from a menu
# - The previous two methods could be invoked, `triangle` and `upside_down_triangle` to print two of these choices, lower-right and upper-right
# - The order of `spaces` and `stars` in the `puts` line could be swapped to switch the print order of stars and spaces, making the triangle align its right corner on the left side instead of right
# - So I will alter the `triangle` and `upside_down_triangle` methods to accept a second argument, `corner`, and code a conditional statement for the output, based on which corner choice was passed in

# - Corner choices of upper-left and upper-right will need to invoke the upside_down_triangle method
#   - Corner choice of upper-left will need to output stars first, then spaces
#   - Corner choice of upper-right will need to putput spaces first, then stars
# - Corner choices of lower-left or lower-right will need to invoke the basic triangle method
#   - Corner choice of lower-left will need to output stars then spaces
#   - corner choice of lower-right will need to output spaces then stars

# # choose_a_corner_triangle(num)
# - Assign `corner` to get_corner_choice
# - Assign 'num_stars` to get_number_of_stars







# get_corner_choice()

# - Present the user with a choice of which 'corner' they want the triangle right angle to be based on
# - The choices will be Lower-Right, Lower-Left, Upper-Left, and Upper-Right. These choices will be represented with the integers 1, 2, 3, and 4, respectively. 

# - Input: none
# - Output: Integer (1, 2, 3, or 4)

# **Algorithm**
# - assign valid_choices to an array of the strings 1 2 3 4
# - Assign `corner_choice` to `nil
# - Output the corner options to the screen, along with the numbers representing them
# - Start a loop
#   - Prompt user for input choice, save as corner_choice
#   - break loop if valid_choices includes corner_choice
#   - otherwise, output to screen that user made an invalid choice
#   - Remind user that choices must be 1, 2, 3, or 4
# - return `corner_choice`

# # get_number_of_stars
# - set `num` to 0
# - start a loop
#   - prompt the user for the number of star points they want in the triangle, save as `num`
#     - valid choices are any decimal digit
#     - break if num is a valid decimal digit (regex /[\d]/)
#     - Otherwise, output that user entered an incorrect message and to try again
#   - return `num`

VALID_CORNER_CHOICES = {
  'LR' => 'Lower-Right',
  'LL' => 'Lower-Left', 
  'UL' => 'Upper-Left', 
  'UR' => 'Upper-Right'
}

def get_number_of_stars
  num = nil
  
  print "How many points do you want in the triangle?: "
  loop do 
    num = gets.chomp
    break if num =~ /\A[0-9]+\z/
    print "That is not a valid positive integer. Please enter your choice   again: "  
  end

  num.to_i
end



def display_corner_choice_menu
  puts "Choose what corner you want your triangle to be based on."
  puts "Your choice dictates where the right angle of the triangle will fall."
  puts "1. Lower-Right"
  puts "2. Lower-Left"
  puts "3. Upper-Left"
  puts "4. Upper-Right"
  print "Enter LR, LL, UL, or UR "
end

def get_corner_choice
  corner = nil
    
  display_corner_choice_menu
  loop do
    corner = gets.chomp.upcase
    break if VALID_CORNER_CHOICES.keys.include?(corner)
    print "That is not a valid choice. Enter LR, LL, UL, or UR: "
  end

  puts "You chose the #{VALID_CORNER_CHOICES[corner]} corner."
  corner
end


# def print_triangle(num, corner)
#   num.times do |idx|
#     spaces = num - (idx + 1)
#     stars = num - spaces
#     if corner == '1'
#       puts (' ' * spaces) + ('*' * stars)
#     else
#       puts ('*' * stars) + (' ' * spaces)
#     end
#   end
# end

# def print_upside_down_triangle(num, corner)

#   num.times do |idx|
#     spaces = idx
#     stars = num - idx

#     if corner == '4'
#       puts (' ' * spaces) + ('*' * stars)
#     else
#       puts ('*' * stars) + (' ' * spaces)
#     end
#   end
# end


def display_triangle(stars, corner)
  case corner
  when 'LR'
    1.upto(stars) { |count| puts ('*' * count).rjust(stars)} #LR
  when 'LL'
    1.upto(stars) { |count| puts ('*' * count).ljust(stars)} #LL
  when 'UR'
    stars.downto(1) {|count| puts ('*' * count).rjust(stars)} #UR
  when
    stars.downto(1) {|count| puts ('*' * count).ljust(stars)} #UL
  end
end

def choose_a_corner_triangle
  corner = get_corner_choice()
  num_stars = get_number_of_stars()
  display_triangle(num_stars, corner)
end


choose_a_corner_triangle()