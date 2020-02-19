# Replace app styesheet with scss file
copy_file "app/assets/stylesheets/application.scss"
remove_file "app/assets/stylesheets/application.css"

# Add manifest.js since it's required for sprockets
copy_file "app/assets/config/manifest.js"

# Add a few useful helpers
copy_file "app/helpers/layout_helper.rb"
copy_file "app/helpers/retina_image_helper.rb"
copy_file "app/helpers/meta_tag_helper.rb"

# Setup a base template and controller
copy_file "app/controllers/home_controller.rb"
copy_file "app/views/layouts/application.html.erb", force: true
template "app/views/layouts/base.html.erb.tt"
copy_file "app/views/shared/_flash.html.erb"
copy_file "app/views/home/index.html.erb"

# Remove default activejobs directory and setup for Sidekiq
remove_dir "app/jobs"
empty_directory_with_keep_file "app/workers"

# Create a services directory
empty_directory_with_keep_file "app/services"
