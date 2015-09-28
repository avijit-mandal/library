require 'rails_helper'

RSpec.describe BookContentController, type: :controller do
	let(:user) { create(:user) }
	let(:subject) {create(:subject)}
	let(:book) { create(:book, user: user, subject: subject) }

	before(:each) { sign_in user }

end
