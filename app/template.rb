def scaffold_stylesheets
  # Replace app styesheet with scss file
  copy_file "app/assets/stylesheets/application.scss"
  remove_file "app/assets/stylesheets/application.css"

  # Copy our bootstrap settings wrapper file
  copy_file "app/assets/stylesheets/settings/_bootstrap-variables.scss"

  empty_directory_with_keep_file "app/stylesheets/components"
  empty_directory_with_keep_file "app/stylesheets/utilities"
end


def assets_configs
  # Add manifest.js since it's required for sprockets
  copy_file "app/assets/config/manifest.js"
end

# Add a few useful helpers
def application_helpers
  copy_file "app/helpers/layout_helper.rb"
  copy_file "app/helpers/retina_image_helper.rb"
  copy_file "app/helpers/meta_tag_helper.rb"
end

# Setup a base template and controller
def setup_controllers
  copy_file "app/controllers/application_controller.rb", force: true
  copy_file "app/controllers/concerns/json_response_helper.rb"
end

# Setup Views
def setup_views
  copy_file "app/views/layouts/application.html.erb", force: true
  template "app/views/layouts/base.html.erb.tt"
  copy_file "app/views/shared/_flash.html.erb"
  copy_file "app/views/application/index.html.erb"
end

# Remove default activejobs directory and setup for Sidekiq
def worker_modifications
  remove_dir "app/jobs"
  empty_directory_with_keep_file "app/workers"
end

# Create a services directory
def setup_custom_services
  empty_directory_with_keep_file "app/forms"
  empty_directory_with_keep_file "app/services"
end

scaffold_stylesheets
assets_configs
application_helpers
setup_controllers
setup_views
worker_modifications
setup_custom_services
