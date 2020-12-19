class CompanyType < ApplicationRecord
    def self.get_company_type_description(cin_number)
        if state_code = self.find_by_code(cin_number[12,3])
            state_code.description
        else
            'NA'
        end
    end
end
