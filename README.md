# Rails Template

This is a fork of [mattbrictson/rails-template](https://github.com/mattbrictson/rails-template) with lots of customizations based on our workflow.

## Description
This is a Ruby on Rails project template to kickstart development of new projects. This is a fairly opinionated template based on our experience and preferred style.

## Requirements

This template currently works with:

* Rails 6.0.x
* PostgreSQL
* Redis

## Installation

*Optional.*

To make this the default Rails application template on your system, create a `~/.railsrc` file with these contents:

```
-d postgresql
-m https://raw.githubusercontent.com/johnkoht/rails-template/master/template.rb
```

## Usage

This template assumes you will store your project in a remote git repository (e.g. Bitbucket or GitHub) and that you will deploy to a production environment. It will prompt you for this information in order to pre-configure your app, so be ready to provide:

1. The git URL of your (freshly created and empty) Bitbucket/GitHub repository
2. The hostname of your production server

To generate a Rails application using this template, pass the `-m` option to `rails new`, like this:

```
rails new blog \
  -d postgresql \
  -m https://raw.githubusercontent.com/johnkoht/rails-template/master/template.rb
```

*Remember that options must go after the name of the application.* The only database supported by this template is `postgresql`.

If you’ve installed this template as your default (using `~/.railsrc` as described above), then all you have to do is run:

```
rails new blog
```

## What does it do?

The template will perform the following steps:

1. Generate your application files and directories
2. Ensure bundler is installed
3. Create the development and test databases
4. Commit everything to git
5. Push the project to the remote git repository you specified


## What's included?

There are a bunch of gems included in the project, most are based on personal preference and experience.

**Server**
- [puma](https://github.com/puma/puma) A Ruby/Rack web server built for concurrency
- [bootsnap](https://github.com/Shopify/bootsnap) Boot large Ruby/Rails apps faster

**Application Gems**
- [devise](https://github.com/heartcombo/devise) Flexible authentication solution for Rails with Warden
- [kaminari](https://github.com/kaminari/kaminari) for pagination

**Background Workers**
- [sidekiq](https://github.com/mperham/sidekiq) Simple, efficient background processing for Ruby
- [sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron) Scheduler / Cron for Sidekiq jobs
- [sidekiq-failures](https://github.com/mhfs/sidekiq-failures) Keep track of Sidekiq failed jobs

**UI/Views**
- [bootstrap](https://github.com/twbs/bootstrap-rubygem) Mixins, scaffolding, layout
- [meta-tags](https://github.com/kpumuk/meta-tags) Search Engine Optimization (SEO) for Ruby on Rails applications
- [rack-canonical-host](https://github.com/tylerhunt/rack-canonical-host) Rack middleware for defining a canonical host name
- [sass-rails](https://github.com/rails/sass-rails) Ruby on Rails stylesheet engine for Sass
- [simple_form](https://github.com/heartcombo/simple_form) Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup
- [turbolinks](https://github.com/turbolinks/turbolinks) Turbolinks makes navigating your web application faster
- [webpacker](https://github.com/rails/webpacker) Use Webpack to manage app-like JavaScript modules in Rails

**Monitoring/Exceptions**
- [honeybadger](https://github.com/honeybadger-io/honeybadger-ruby) Ruby gem for reporting errors to honeybadger.io

**Development Gems**
- [active_record_query_trace](https://github.com/brunofacca/active-record-query-trace) Rails plugin that logs/displays a backtrace of all SQL queries executed by Active Record
- [annotate](https://github.com/ctran/annotate_models) Annotate Rails classes with schema and routes info
- [awesome_print](https://github.com/awesome-print/awesome_print) Pretty print your Ruby objects with style -- in full color and with proper indentation
- [better_errors](https://github.com/BetterErrors/better_errors) Better error page for Rack apps
- [brakeman](https://github.com/presidentbeef/brakeman) A static analysis security vulnerability scanner for Ruby on Rails applications
- [bullet](https://github.com/flyerhzm/bullet) Help to kill N+1 queries and unused eager loading
- [bundler-audit](https://github.com/rubysec/bundler-audit) Patch-level verification for Bundler
- [dotenv-rails](https://github.com/bkeepers/dotenv) A Ruby gem to load environment variables from `.env`
- [guard](https://github.com/guard/guard) Guard is a command line tool to easily handle events on file system modifications
- [pry-rails](https://github.com/rweng/pry-rails) A runtime developer console and IRB alternative with powerful introspection capabilities
- [letter_opener](https://github.com/ryanb/letter_opener) Preview mail in the browser instead of sending
- [rubocop](https://github.com/rubocop-hq/rubocop) A Ruby static code analyzer and formatter, based on the community Ruby style guide
- [rubocop-rails](https://github.com/rubocop-hq/rubocop-rails) A RuboCop extension focused on enforcing Rails best practices and coding conventions
- [rubocop-performance](https://github.com/rubocop-hq/rubocop-performance) An extension of RuboCop focused on code performance checks

**Testing Gems**
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing
- [rails-controller-testing](https://github.com/rails/rails-controller-testing) Brings back `assigns` and `assert_template` to your Rails tests
- [rspec-rails](https://github.com/rspec/rspec-rails) RSpec for Rails-3+
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) Simple one-liner tests for common Rails functionality
- [simplecov](https://github.com/colszowka/simplecov) Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
- [webmock](https://github.com/bblimke/webmock) Library for stubbing and setting expectations on HTTP requests in Ruby

#### Other tweaks that patch over some Rails shortcomings

* A much-improved `bin/setup` script
* Log rotation so that development and test Rails logs don’t grow out of control

