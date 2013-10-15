module YmModeration
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include YmCore::Generators::Migration
      include YmCore::Generators::Ability

      source_root File.expand_path("../templates", __FILE__)
      desc "Installs YmModeration."

      def manifest
        # examples ->
        # copy_file "models/page.rb", "app/models/page.rb"
        # if should_add_abilities?('Page')
        #   add_ability(:open, "can :show, Page, :draft => false")
        # end
        # try_migration_template "migrations/create_pages.rb", "db/migrate/create_pages"

        copy_file "controllers/flaggings_controller.rb", "app/controllers/flaggings_controller.rb"
        copy_file "models/flag.rb", "app/models/flag.rb"
        copy_file "models/flagging.rb", "app/models/flagging.rb"
        copy_file "models/flagging.rb", "app/models/flagging_category.rb"

        # Migrations must go last
        Dir[File.dirname(__FILE__) + '/templates/migrations/*.rb'].each do |file_path|
          file_name = file_path.split("/").last
          try_migration_template "migrations/#{file_name}", "db/migrate/#{file_name.sub(/^\d+\_/, '')}"
        end
      end

    end
  end
end