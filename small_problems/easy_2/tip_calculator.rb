# Tip Calculator

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def get_bill_amt
  print "How much is the bill?: "
  bill_amt = gets.chomp.strip

  until valid_amount?(bill_amt)
    puts "Enter an amount greater than 0: "
    bill_amt = gets.chomp.strip
  end

  bill_amt.to_f
end

def get_tip_percent
  print "How much is the tip percentage?: "
  tip = gets.chomp.strip

  until valid_amount?(tip)
    puts "Enter an amount greater than 0: "
    tip = gets.chomp.strip
  end

  tip.to_f
end  

def print_total_bill(bill, tip)
  puts "The tip amount is: $%0.2f" % [tip]
  puts "The total bill amount is: $%0.2f" % [bill]
end

def valid_amount?(amount)
  amount.to_f > 0
end

initial_bill_amt = get_bill_amt()
tip_percent      = get_tip_percent()
tip_decimal      = tip_percent / 100
tip_amt          = tip_decimal * initial_bill_amt
total_bill_amt   = tip_amt + initial_bill_amt

print_total_bill(total_bill_amt, tip_amt)