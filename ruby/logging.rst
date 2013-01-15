Rails Logging
==================

禁用Assets日志
--------------
使用 https://github.com/evrone/quiet_assets

或者创建 `config/initializers/quiet_assets.rb` ::

    Rails.application.assets.logger = Logger.new(RUBY_PLATFORM =~ /(win|w)32$/ ? "NUL" : "/dev/null")
    Rails::Rack::Logger.class_eval do
      def call_with_quiet_assets(env)
        previous_level = Rails.logger.level
        Rails.logger.level = Logger::ERROR if env['PATH_INFO'].index("/assets/") == 0
        call_without_quiet_assets(env).tap do
          Rails.logger.level = previous_level
        end
      end
      alias_method_chain :call, :quiet_assets
    end

参考 http://stackoverflow.com/a/9179514/260793
