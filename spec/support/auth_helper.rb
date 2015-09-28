module AuthHelper
  def signin_user(user)
    visit root_path
    within '#user_nav' do
			click_link 'Sign in'
		end
    fill_in 'Email', with: user.email
		fill_in 'Password', with: '12345678'
    click_button 'Log in'
  end
end

# RSpec.configure do |config|
#   config.include SignInHelper, :type => :request
# end