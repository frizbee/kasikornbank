# require 'rails/generators/active_record'

module Kasikornbank
  module Generators
    class InstallGenerator < Rails::Generators::Base
      # include Rails::Generators::Migration
      source_root File.expand_path('../templates',__FILE__)

      desc "Creates KBank initializer to your application"

      def generate_initializer
        template "config/initializers/kasikornbank.rb", 'config/initializers/kasikornbank.rb'
      end
    end
  end
end
