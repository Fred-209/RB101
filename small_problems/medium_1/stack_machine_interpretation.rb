# # Stack Machine Interpretation

# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily
# implemented as an Array that just uses the #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

# **Rules/Requirements**

# *Input*: a string ( consists of various commands I need to parse, separated by space)
  
# *Output*: an integer (the register value)


# *Explicit Requirements*: 
# - intialize the `register` to 0
# - the `stack` will be an array of integers
# - the last item listed in the `stack` is considered the top of the stack
# - Different command words are passed in via the given string, in all caps, and they all should do different functions
# - all operation commands are integer operations
# - See list above for what each operation command should do


# *Implicit Requirements*: 
#  - If an argument is an integer, that represents the register value and should be assigned to `register`
# - The return value of the method doesn't seem important. What is PRINTed is shown on the screen, and that's the only test cases provided 


# *Questions:*
# - Once given string is conveted to an array of stings, how can I tell when one is an integer?
#   - can convert it to an integer, then back to a string, and see if it equals the original string or not
# *Edge Cases*:
# - none here really, as the operations are clearly defined and will be no inputs
#   that don't fit one of the operations
# - 

# **Examples/Test Cases**
# ```ruby
# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)
# ```

# **Data Structure**
# Initial: string

# Intermediate: array of string elements
# - consisting of each of the operations from the given string

# Final: output to the screen (possibly)



# **Algorithm**

# *High level thought process / brainstorming ideas
# - Break the given string up into an array of string elements, delimited on space characters
# - Need to iterate over this array of strings
# - first check to see if current element is a string integer, and if so convert it to an integer and perform the 
#   operation above listed for `n`
# - I need to check each element for equality against the list of commands given above, such as ADD, PRINT, etc
#   - Then perform the operation as specified above for whicever command matches this element
#   - do this for every element in the string array

# - maybe use `case` statement or lengthy if/elsif branch

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# *Lower level steps of implementation*
# - assign `commands` variable to the result of converting the given string into an array of string elements
# delimited on spaces
# - initialze `register` to 0
# - intialize `stack` to an empty array

# - Iterate `commands` with the `each` method
#   - If current element converted to an integer then back to a string is == to the current element:
#     - convert element to an integer
#     - reassign `register` to this integer
#   - elsif element == to 'PUSH':
#     - add `register` onto the end of `stack`.
#     - leave register as the same value
#   - elsif 'ADD':
#     - pop last item from `stack`, incremement `register` value by this amount
#   - elsif 'SUB'
#     - pop last item from `stack`, decremement `register` by this amount
#   - elsif 'MULT':
#     - pop last item from `stack` , multiply `register` by this and save as `register`
#   - elsif 'DIV':
#     - pop last item from stack, divides `register` by this and saving result as `register`
#   - elsif 'MOD`:
#     - pop last item from stack, performs a `register` mod item operation and save this remainer as the `register`
#   - elsif 'POP': 
#     - pop last item from stack, save this value as `register`
#   - else:
#     - print the register value to the screen
# end
    




# **Code Implementation**
  
require 'pry'

def minilang(string_of_operations)
  operations = string_of_operations.split
  register = 0
  stack = []
  
  operations.each do |operation|
    if operation.to_i.to_s == operation
      register = operation.to_i
    elsif operation == 'PUSH'
      stack.push(register)
    elsif operation == 'ADD'
      register += stack.pop
    elsif operation == 'SUB'
      register -= stack.pop
    elsif operation == 'MULT'
      register *= stack.pop
    elsif operation == 'DIV'
      register /= stack.pop
    elsif operation == 'MOD'
      register %= stack.pop
    elsif operation == 'POP'
      register = stack.pop
    elsif operation == 'PRINT'
      puts register
    end
    
  end
  
end




# minilang('PRINT')
# # # 0

# minilang('5 PUSH 3 MULT PRINT')
# # # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # # 5
# # # 3
# # # 8

# minilang('5 PUSH POP PRINT')
# # # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # # 5
# # # 10
# # # 4
# # # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # # 8

# minilang('6 PUSH')
# # # (nothing printed; no PRINT commands)



# Further Exploration
# Try writing a minilang program to evaluate and print the result of this expression:

# Copy Code
# (3 + (4 * 5) - 7) / (5 % 3)
# The answer should be 8. This is trickier than it sounds! Note that we aren't asking
#  you to modify the #minilang method; we want you to write a Minilang program that 
#  can be passed to #minilang and evaluated.

# Add some error handling to your method. In particular, have the method detect empty 
# stack conditions, and invalid tokens in the program, and report those. Ideally, 
# the method should return an error message if an error occurs, and nil if the program 
# runs successfully.

# *Differences/takeaways*
# - Need to convert the given expression into a format the minilang method can understand
# - don't modify the minilang method
# - need to eliminate parentheses in the given expression
# - need to convert each operator to it's written form
#   - '+' should be 'ADD', '*' is 'MULTI', etc
# - need to figure out a way to group evaluations in the expressions according to 
# how the parentheses are laid out.
#   - (4 * 5) needs to be evaluated before  3 + and - 7, etc

  (3 + (4 * 5) - 7) / (5 % 3)
#   3 PUSH 5 MOD PUSH 4 PUSH 5 MULTI PUSH 3 ADD PUSH 7 SUB DIV 
command_string = (3 + (4 * 5) - 7) / (5 % 3)

minilang("3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH POP SUB DIV PRINT")


def convert_to_minilang(math_expression)
 
end  

*Convert to Minilang*
- input: string, output: string
- Convert a given mathematical expression into a string that the `minilang` method 
can process

convert_to_minilang("(3 + (4 * 5) - 7) / (5 % 3)") == "3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH POP SUB DIV PRINT"

  # n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).