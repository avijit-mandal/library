require 'rails_helper'

RSpec.describe Subject do
	it {should have_many(:books)}
end