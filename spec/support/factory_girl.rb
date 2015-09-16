RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    begin
    	#Starting database cleaning before executing FactoryGirl
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
    	#for cleaning data entry by FactoryGirl
      DatabaseCleaner.clean
    end
  end
end