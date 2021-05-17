ENV['APP_ENV'] = 'test'
require "test/unit"
require 'rack/test'
require 'json'
require 'sinatra'
require_relative '../app'

class RootPostTest < Test::Unit::TestCase

    include Rack::Test::Methods

    def app
        builder = Rack::Builder.new
        builder.run PayslipApp
    end

    def test_get
        get '/'
        assert last_response.ok?
    end


    def test_post
        mock_data = {
            "employee_name": "Ren",
            "gross_monthly_income": "$5000.00",
            "monthly_income_tax": "$500.00",
            "net_monthly_income": "$4500.00"
        }
        post '/?employee=Ren&salary=60000'
        assert last_response.ok?
        assert_equal last_response.body, mock_data.to_json
    end

    def test_get_salary_computations
       
        post '/?employee=Ren&salary=60000'
        get '/salary/computations/2'
        result_hash = JSON.parse(last_response.body)
        assert last_response.ok?
        assert_equal result_hash['salary_computations'][0]['monthly_income_tax'], "$500.00"
    end
end