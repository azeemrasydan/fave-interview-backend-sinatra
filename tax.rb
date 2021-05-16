TAX_BRACKET = { 20000 => 0, 40000 => 0.1, 80000 => 0.2, 180000 => 0.3, 1e12 => 0.4}

def generate_monthly_payslip(taxpayer, annual_income)

    accumulative_tax = 0
    remaining_income_to_tax = annual_income
    previous_salary = 0

    # Time Complexity is estimated to be O(n)
    TAX_BRACKET.each do | salary, rate |

        taxable_amount = salary - previous_salary 

        if remaining_income_to_tax < taxable_amount

            total_tax = remaining_income_to_tax * rate
            accumulative_tax = accumulative_tax + total_tax
            # puts "Taxable Income: $#{remaining_income_to_tax}  || Total Tax: $#{total_tax}"
            
            break
        else

            remaining_income_to_tax = remaining_income_to_tax - taxable_amount
            total_tax = taxable_amount * rate
            accumulative_tax = accumulative_tax + total_tax
            # puts "Taxable Income: $#{taxable_amount}  || Total Tax: $#{total_tax}"

        end

        previous_salary = salary
        
    end

    gross_monthly_income = format("$%.2f",annual_income / 12)
    monthly_accumulative_tax = format("$%.2f",accumulative_tax / 12)
    net_monthly_income = format("$%.2f",(annual_income -accumulative_tax) / 12)

    puts "Monthly Payslip for: \"#{taxpayer}\""
    puts "Gross Monthly Income: #{gross_monthly_income}"
    puts "Monthly Income Tax: #{monthly_accumulative_tax}"
    puts "Net Monthly Income: #{net_monthly_income}"
end

begin
    generate_monthly_payslip "Amin", 50000
rescue => exception
    puts exception
end