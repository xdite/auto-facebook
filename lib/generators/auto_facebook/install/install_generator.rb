module AutoFacebook

  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      self.source_paths << File.join(File.dirname(__FILE__), 'templates')

      def inject_to_user_model
        inject_into_file 'app/models/user.rb', "\n  extend OmniauthCallbacks\n\n  ", :before => /devise :/
        inject_into_file 'app/models/user.rb', ", :omniauthable", :after => /:validatable/
      end

      def inject_to_routing
        gsub_file 'config/routes.rb', /devise_for :users/, 'devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }'
      end

      def inject_to_devise_setting
        inject_into_file 'config/initializers/devise.rb', "\n config.omniauth :facebook, Setting.facebook_app_id, Setting.facebook_secret, :scope => 'email'\n", :after => /# ==> OmniAuth/
      end

      def copy_initializer_of_omniauth
        template 'omniauth.rb', 'config/initializers/omniauth.rb'
      end

    end
  end

end
