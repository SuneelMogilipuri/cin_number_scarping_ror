class CinDetailsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user.email
    end

    def create_cin_number_details
        cin_number = params['cin_number'].dup
        @cin_details = CinDetail.new
        @cin_details.user = current_user
        @cin_details.cin_number = params['cin_number']
        @cin_details.listing_status = (cin_number[0] == "U") ? "unlisted company" : "listed company"
        @cin_details.industry_code = IndustryCode.get_industry_code_description(cin_number)
        @cin_details.state_code = StateCode.get_state_code_description(cin_number)
        @cin_details.company_inc_yr = cin_number[8,4]
        @cin_details.company_type = CompanyType.get_company_type_description(cin_number)
        @cin_details.reg_number = cin_number[15,6]  
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
