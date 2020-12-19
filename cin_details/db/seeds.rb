# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.count > 0
    user = User.new(
        :email                 => "test@example.com",
        :password              => "testing",
        :password_confirmation => "testing"
    )
    user.save!
end

# seeding all state codes in db 
state_codes = JSON.parse(File.read("./public/state_codes.json"))
state_codes.each do |key, value|
    next unless StateCode.find_by_code(key).blank?
    StateCode.create(:code => key, :description => value) 
end

# seeding all industry codes in db
industry_codes = JSON.parse(File.read("./public/industry_codes.json"))
industry_codes.each do |key, value|
    next unless IndustryCode.find_by_code(key).blank?
    IndustryCode.create(:code => key, :description => value) 
end

# seeding all company types in db
company_types = JSON.parse(File.read("./public/company_type.json"))
company_types.each do |key, value|
    next unless CompanyType.find_by_code(key).blank?
    CompanyType.create(:code => key, :description => value) 
end