require "rails_helper"

describe User do
 it 'returns full name' do
   profile = User.create(first_name: 'Amit', last_name: 'Saha')

   expect(profile.full_name).to eq 'Amit Saha'
 end

 it 'returns nil as full name when first name blank' do
 	expect(described_class.new.full_name).to eq nil
 end

 it 'is invalid without first name' do
 	expect(User.new(first_name: nil)).to have(1).error_on(:first_name)
 end

 it 'is invalid without last name' do
 	expect(User.new(last_name: nil)).to have(1).error_on(:last_name)
 end

end