require 'rails/generators/base'

module ScanAcl
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      # include Rails::Generators::Base
      source_root File.expand_path('../views_templates', __FILE__)
      desc "add the views"

      def create_views
        # puts '1111'
        # directory "characters", "app/views/characters"
        template "characters/index.html.slim", "app/views/characters/index.html.slim"
      end
    end
  end
end
