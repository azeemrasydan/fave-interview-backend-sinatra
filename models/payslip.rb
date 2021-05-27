require "datamapper"
module Payslip
    # Singleton Design Pattern
    DataMapper.setup(:default, "sqlite3::memory:")

    # Models
    class Payslip
        include DataMapper::Resource
        
        property :id,    Integer, :serial => true

        property :time_stamp, String
        property :employee_name, String
        property :annual_salary, String
        property :monthly_income_tax, String
    end

    Payslip.auto_migrate!
    first_post = Payslip.new
    first_post.time_stamp = "Hello"
    first_post.employee_name = "Alan"
    first_post.annual_salary = "$100000"
    first_post.save
end


