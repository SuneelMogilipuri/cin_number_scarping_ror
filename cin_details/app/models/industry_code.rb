class IndustryCode < ApplicationRecord
    def self.get_industry_code_description(cin_number)
        byebug
        if ind_code = self.find_by_code(cin_number[1,5]) 
            ind_code.description 
        else
            'NA'
        end
    end
end
