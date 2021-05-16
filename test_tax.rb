require "test/unit"
require_relative './tax'

class TaxTest < Test::Unit::TestCase
    
  def test_tax
    monthly_payslip1 = generate_monthly_payslip "Amin", 50000
    mock_payslip1 = Hash[ \
        "employee_name" => "Amin" ,\
        "gross_monthly_income" => "$4166.00",\
        "monthly_income_tax" => "$333.33",\
        "net_monthly_income" =>"$3833.33"]

    monthly_payslip2 = generate_monthly_payslip "Ren", 60000
    mock_payslip2 = Hash[ \
        "employee_name" => "Ren" ,\
        "gross_monthly_income" => "$5000.00",\
        "monthly_income_tax" => "$500.00",\
        "net_monthly_income" =>"$4500.00"]

    assert_equal mock_payslip1, monthly_payslip1, "mock payslip1 should return the value of the monthly payslip1"
    assert_equal mock_payslip2, monthly_payslip2, "mock payslip2 should return the value of the monthly payslip2"


  end

end