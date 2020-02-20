mailer_regex = /config\.action_mailer\.raise_delivery_errors = false\n/

comment_lines "config/environments/development.rb", mailer_regex
insert_into_file "config/environments/development.rb", after: mailer_regex do
  <<-RUBY

  # Ensure mailer works in development.
  if ENV.fetch("SMTP_ADDRESS").present?
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              ENV["SMTP_ADDRESS"],
      domain:               ENV["SITE_DOMAIN"],
      port:                 ENV["SMTP_PORT"] || 587,
      enable_starttls_auto: true,
      authentication:       ENV["SMTP_AUTHENTICATION"] || "plain",
      user_name:            ENV["SMTP_USER_NAME"],
      password:             ENV["SMTP_PASSWORD"]
    }

    if ENV.fetch("RECIPIENT_INTERCEPTOR_EMAIL")
      Mail.register_interceptor RecipientInterceptor.new(ENV.fetch("RECIPIENT_INTERCEPTOR_EMAIL"))
    end
  else
    config.action_mailer.delivery_method = :letter_opener
  end
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: ENV.fetch("APPLICATION_HOST") }
  config.action_mailer.asset_host = ENV.fetch("ASSET_HOST")
  RUBY
end

insert_into_file "config/environments/development.rb", before: /^end/ do
  <<-RUBY

  # Automatically inject JavaScript needed for LiveReload.
  config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)
  RUBY
end

gsub_file "config/environments/development.rb",
          "join('tmp/caching-dev.txt')",
          'join("tmp", "caching-dev.txt")'
