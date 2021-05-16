# Can be dynamically determined from database in the future
TAX_BRACKET = { 20000 => 0, 40000 => 0.1, 80000 => 0.2, 180000 => 0.3, 1e12 => 0.4}

def generate_monthly_payslip(taxpayer, annual_income)

    # Initialize variables before looping through all salary brackets for tax application segregations
    accumulative_tax = 0
    remaining_income_to_tax = annual_income
    previous_salary = 0

    # Time Complexity is estimated to be O(n)
    TAX_BRACKET.each do | salary, rate |

        taxable_amount = salary - previous_salary 

        if remaining_income_to_tax < taxable_amount

            total_tax = remaining_income_to_tax * rate
            accumulative_tax = accumulative_tax + total_tax
            
            break
        else

            remaining_income_to_tax = remaining_income_to_tax - taxable_amount
            total_tax = taxable_amount * rate
            accumulative_tax = accumulative_tax + total_tax

        end

        previous_salary = salary
        
    end

    # Ensure that decimals be converted to string in $ dollar format with two decimal places
    gross_monthly_income = format("$%.2f",annual_income / 12)
    monthly_income_tax = format("$%.2f",accumulative_tax / 12)
    net_monthly_income = format("$%.2f",(annual_income -accumulative_tax) / 12)

    monthly_payslip = Hash["employee_name" => taxpayer, "gross_monthly_income" => gross_monthly_income, "monthly_income_tax" => monthly_income_tax, "net_monthly_income" => net_monthly_income]
    return monthly_payslip

    puts "Monthly Payslip for: \"#{taxpayer}\""
    puts "Gross Monthly Income: #{gross_monthly_income}"
    puts "Monthly Income Tax: #{monthly_income_tax}"
    puts "Net Monthly Income: #{net_monthly_income}"

end

# Test run by observing the console output
begin
    puts generate_monthly_payslip "Amin", 50000
rescue => exception
    puts exception
end