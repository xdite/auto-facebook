require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module AutoFacebook

  module Generators
    class UserGenerator < ::Rails::Generators::Base
      include ::Rails::Generators::Migration

      self.source_paths << File.join(File.dirname(__FILE__), 'templates')

      def create_migration_file
        migration_template "migration.rb", "db/migrate/add_fb_id_to_user.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end

end
