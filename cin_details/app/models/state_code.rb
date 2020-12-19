class StateCode < ApplicationRecord
    def self.get_state_code_description(cin_number)
        if state_code = self.find_by_code(cin_number[6,2])
            state_code.description
        else
            'NA'
        end
    end
end
