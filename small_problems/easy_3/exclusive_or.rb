# Exclusive Or

# The  `||`  operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The  `&&`  operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called  **exclusive or**.

# def xor?(bool_1, bool_2)
#   if (bool_1 && bool_2) || (!bool_1 && !bool_2)
#     false
#   else
#     true
#   end
# end

def xor?(bool_1, bool_2)
  !(!!bool_1 == !!bool_2)
end


p xor?(5.even?,  4.even?)  #==  true 
p xor?(5.odd?,  4.odd?)  #==  true 
p xor?(5.odd?,  4.even?)  #==  false 
p xor?(5.even?,  4.odd?)  #==  false
