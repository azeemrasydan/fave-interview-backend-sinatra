require 'sinatra'
require_relative './tax'
require 'json'
require_relative './models/payslip'
require 'date'

# Abstract Factory Design Pattern
class PayslipApp < Sinatra::Base

    include Payslip

    before do
        content_type :json
    end

    get '/' do
        status 200
        Payslip.get(1).employee_name
    end

    post '/'do
        employee_name = params[:employee]
        annual_income = params[:salary]

        payslip = generate_monthly_payslip employee_name, annual_income.to_f
        my_payslip = Payslip.new
        my_payslip.time_stamp = Time.now.strftime("%d/%m/%Y %H:%M")
        my_payslip.employee_name = params[:employee]
        my_payslip.annual_salary = "$#{annual_income}"
        my_payslip.monthly_income_tax = payslip['monthly_income_tax']
        my_payslip.save

        payslip.to_json
    end

    get '/salary/computations/:id' do
        value = Payslip.get(params[:id].to_i)
        json_value = value.to_json(:only => [:time_stamp,:employee_name,:annual_salary,:monthly_income_tax])
        result = Hash["salary_computations" => [JSON.parse(json_value)]]
        result.to_json
    end

end
