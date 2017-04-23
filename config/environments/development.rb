Rails.application.configure do
  # # Settings specified here will take precedence over those in config/application.rb.
  #
  # # In the development environment your application's code is reloaded on
  # # every request. This slows down response time but is perfect for development
  # # since you don't have to restart the web server when you make code changes.
  # config.cache_classes = true
  #
  # # # Do not eager load code on boot.
  # # config.eager_load = false
  #
  # # Eager load code on boot. This eager loads most of Rails and
  # # your application in memory, allowing both threaded web servers
  # # and those relying on copy on write to perform better.
  # # Rake tasks automatically ignore this option for performance.
  # config.eager_load = true
  #
  # # Show full error reports.
  # config.consider_all_requests_local       = false
  # config.action_controller.perform_caching = true
  #
  # # # Enable/disable caching. By default caching is disabled.
  # # if Rails.root.join('tmp/caching-dev.txt').exist?
  # #   config.action_controller.perform_caching = true
  # #
  # #   config.cache_store = :memory_store
  # #   config.public_file_server.headers = {
  # #     'Cache-Control' => 'public, max-age=172800'
  # #   }
  # # else
  # #   config.action_controller.perform_caching = false
  # #
  # #   config.cache_store = :null_store
  # # end
  #
  # # Don't care if the mailer can't send.
  # # config.action_mailer.raise_delivery_errors = false
  #
  # config.action_mailer.perform_caching = false
  #
  # # Print deprecation notices to the Rails logger.
  # config.active_support.deprecation = :log
  #
  # # Raise an error on page load if there are pending migrations.
  # config.active_record.migration_error = :page_load
  #
  # # Debug mode disables concatenation and preprocessing of assets.
  # # This option may cause significant delays in view rendering with a large
  # # number of complex assets.
  # config.assets.debug = true
  #
  # # Suppress logger output for asset requests.
  # config.assets.quiet = true
  #
  # # config.assets.compile = true
  # # config.assets.precompile =  ['*.js', '*.css', '*.css.erb', '*.slim']
  # config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  #
  # # Compress JavaScripts and CSS.
  # config.assets.js_compressor = :uglifier
  # # config.assets.css_compressor = :sass
  #
  # # Do not fallback to assets pipeline if a precompiled asset is missed.
  # config.assets.compile = false
  #
  # # Raises error for missing translations
  # # config.action_view.raise_on_missing_translations = true
  #
  # # Use the lowest log level to ensure availability of diagnostic information
  # # when problems arise.
  # config.log_level = :debug
  #
  # # Prepend all log lines with the following tags.
  # config.log_tags = [ :request_id ]
  #
  # # Use default logging formatter so that PID and timestamp are not suppressed.
  # config.log_formatter = ::Logger::Formatter.new
  #
  # # Use a different logger for distributed setups.
  # # require 'syslog/logger'
  # # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')
  #
  # if ENV["RAILS_LOG_TO_STDOUT"].present?
  #   logger           = ActiveSupport::Logger.new(STDOUT)
  #   logger.formatter = config.log_formatter
  #   config.logger = ActiveSupport::TaggedLogging.new(logger)
  # end
  #
  # # Do not dump schema after migrations.
  # config.active_record.dump_schema_after_migration = false
  #
  # # Use an evented file watcher to asynchronously detect changes in source code,
  # # routes, locales, etc. This feature depends on the listen gem.
  # # config.file_watcher = ActiveSupport::FileUpdateChecker



  #  DEFAULT CONFIG SETTINGS -
  # Added back April 20, 2017, to generate error messages on browser
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::FileUpdateChecker

end
