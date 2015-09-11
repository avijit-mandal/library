class TestMailer < ApplicationMailer
	default from: 'letstagon@gmail.com'
 
  def welcome_email(test)
    @test = test
    mail(to: @test.email, subject: 'Welcome to My Awesome Site')
  end
end
