# this is small program
# to calculate loan repayments

def prompt(msg)
  print "=>#{msg}"
end

def valid_number?(num)
  Float(num)
rescue
  false
end

prompt("Monthly repayments calculator.\n")
# this is mine loop
loop do
  prompt("--------------------------------\n")

  prompt('How much would you like to borrow? £')
  loan_amount = 0
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f > 0
      loan_amount = loan_amount.to_f
      break
    else
      prompt("This is not valid amount! Please enter number e.g. 200.50 \n")
      prompt('')
    end
  end

  prompt('What is the loan APR? ')
  loan_apr = 0
  loop do
    loan_apr = gets.chomp
    if valid_number?(loan_apr) && loan_apr.to_f > 0
      loan_apr = loan_apr.to_f / 100 # convert percentage to actual number
      break
    else
      prompt("This is not a valid amount! \
Please enter positive number e.g. 3.5 \n")
      prompt('')
    end
  end

  prompt('How long is the loan for? (months) ')
  loan_length_months = 0
  loop do
    loan_length_months = gets.chomp
    if valid_number?(loan_length_months) \
      && loan_length_months.to_i.to_s == loan_length_months \
      && loan_length_months.to_i > 0
      loan_length_months = loan_length_months.to_i
      break
    else
      prompt("This is not a valid number! \
Please only enter whole months e.g. 36 \n")
      prompt('')
    end
  end

  loan_monthly_rate = loan_apr / 12

  if loan_apr != 0
    monthly_payment = loan_amount * \
                      (loan_monthly_rate / (1 - (1 + loan_monthly_rate) \
                      **-loan_length_months))
  else
    monthly_payment = loan_amount / loan_length_months
  end

  prompt("Monthly repayments £ #{format('%02.2f', monthly_payment)} \n")
  prompt('Would you like to calculate another loan? (Y/N)? ')

  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thank you for using the loan calculator \n")
prompt("Good bye! \n")
