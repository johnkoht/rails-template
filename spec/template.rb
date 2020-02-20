# Run the Rspec installer script
system("rails generate rspec:install")

# Add our custom test helpers
copy_file "spec/support/json_helper.rb"
copy_file "spec/support/shoulda_matchers.rb"
copy_file "spec/support/webmock.rb"

# Initialize typical project folders
empty_directory_with_keep_file "spec/controllers"
empty_directory_with_keep_file "spec/factories"
empty_directory_with_keep_file "spec/forms"
empty_directory_with_keep_file "spec/models"
empty_directory_with_keep_file "spec/services"


# Customize the spec/rails_helper.rb file
#

# Uncomment the line that autoloads support and other directores
uncomment_lines "spec/rails_helper.rb", /Dir.*require f \}/

# Require the typical spec helpers
insert_into_file "spec/rails_helper.rb", after: /# Add additional requires below this line. Rails is not loaded until this point\!\n/ do
  <<-RUBY
require "database_cleaner"
require "factory_bot_rails"
require "shoulda-matchers"
require "webmock/rspec"
  RUBY
end

# Customize our test suite configuration to include
# database cleaner, devise contorller hlpers and
# include shoulda matchers in form objects
insert_into_file "spec/rails_helper.rb", before: /^end/ do
  <<-RUBY

  config.order = :random

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Devise
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.include(Shoulda::Matchers::ActiveModel,  type: :form)
  config.include(Shoulda::Matchers::ActiveRecord, type: :form)
  RUBY
end
