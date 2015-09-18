require 'rails_helper'

describe Subject do
	it {should have_many(:books)}
end