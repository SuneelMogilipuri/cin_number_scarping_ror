class CinDetailsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user.email
    end

    def cin_number_details
        cin_number = params['cin_number'].dup
        @cin_details = CinDetail.new
        @cin_details.user = current_user
        @cin_details.cin_number = params['cin_number']
        @cin_details.listing_status = (cin_number.slice!(0) == "U") ? "unlisted company" : "listed company"
        industry_codes = JSON.parse(File.read("./public/industry_codes.json"))
        @cin_details.industry_code = industry_codes[cin_number.slice!(0,5)]
        state_codes = JSON.parse(File.read("./public/state_codes.json"))
        @cin_details.state_code = state_codes[cin_number.slice!(0,2)]
        @cin_details.company_inc_yr = cin_number.slice!(0,4)
        company_types = JSON.parse(File.read("./public/company_type.json"))
        @cin_details.company_type = company_types[cin_number.slice!(0,3)]
        @cin_details.reg_number = cin_number  
        if @cin_details.save   
            render :index
        else   
            render :index   
        end 
    end

    def history
        render :history
    end

end
