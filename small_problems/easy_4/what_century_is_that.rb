# What Century is That?

# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def century(year)
  return '1st' if year < 101

  century, remainder_years = year.divmod(100)
  century +=1 if remainder_years > 0
  century = century.to_s

  if century.length >= 2
    century_end_digits = century[-2, 2]
  else
    century_end_digits = century[0]
  end

   
  if ['11', '12', '13'].include?(century_end_digits)
    return century + 'th'
  elsif century_end_digits[-1] == '1'
    return century + 'st'
  elsif century_end_digits[-1] == '2'
    return century + 'nd'
  elsif century_end_digits[-1] == '3'
    return century + 'rd'
  else 
    return century + 'th'
  end 
 
end

p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) # == '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) # == '12th'
p century(11201) #== '113th'