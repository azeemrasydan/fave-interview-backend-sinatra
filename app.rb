# app.rb
require 'sinatra'
require_relative './tax'
require 'json'

class PayslipApp < Sinatra::Base

    # before do
    #     request.body.rewind
    #     @request_payload = JSON.parse request.body.read
    # end

    before do
        content_type :json
    end

    get '/' do
        status 200
        "Hello World"
    end

    post '/'do
        employee_name = params[:employee]
        annual_income = params[:salary]

        payslip = generate_monthly_payslip employee_name, annual_income.to_f
        payslip.to_json
    end


# For Reference
#   get '/:name' do
#     "Hello, #{params[:name]}!"
#   end

#   get '/:greeting/?:name?' do
#     "#{params[:greeting]}, #{params[:name] ? params[:name] : 'world'}!"
#   end

end