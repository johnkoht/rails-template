# Add/overwrite configurations
apply "config/application.rb"
template "config/database.example.yml.tt"
remove_file "config/database.yml"
copy_file "config/puma.rb", force: true
remove_file "config/secrets.yml"

# Sidekiq configuration
copy_file "config/sidekiq.yml"
template "config/initializers/sidekiq.rb.tt"
copy_file "config/schedule.yml"

# Add the home route
gsub_file "config/routes.rb", /  # root 'welcome#index'/ do
  '  root "application#index"'
end

# Copy initializers over
copy_file "config/initializers/generators.rb"
copy_file "config/initializers/inline_svg.rb"
copy_file "config/initializers/rotate_log.rb"
copy_file "config/initializers/version.rb"

# Define which params to filter out in the logs
gsub_file "config/initializers/filter_parameter_logging.rb", /\[:password\]/ do
  "%w[password secret session cookie csrf]"
end

# Copy the environment customizations
apply "config/environments/development.rb"
apply "config/environments/production.rb"
apply "config/environments/test.rb"

# The default application route as well as mount sidekiq
route 'root "application#index"'
route %Q(mount Sidekiq::Web => "/sidekiq" # monitoring console\n)
