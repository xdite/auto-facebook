# -*- encoding : utf-8 -*-
class User
  module OmniauthCallbacks
    
      ["facebook"].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        uid = response["uid"]
        data = response["info"]
      
        credentials= response['credentials']

        if user = User.where( :fb_id => uid).first
          return user
        elsif user = User.find_by_email(data["email"])
          user.update_attribute(:fb_id ,uid )
          return user
        else
          user = User.new_from_provider_data(provider,uid,data, credentials)
          if user.save(:validate => false)
            user.fb_id = uid
            user.save
            return user
          else
            Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            return nil
          end
        end
        
      end
    end
     
    
    def new_from_provider_data(provider, uid, data,credentials)
      user = User.new
      user.email = data["email"]
      user.token = credentials['token']
      user.name = data["nickname"] ? data ["nickname"] : data["name"]

      user.name.gsub!(/[^\w]/, "_")
      if User.where(:name => user.name).count > 0 || user.name.blank?
        user.name = "u#{Time.now.to_i}"
      end
      
      user.password = Devise.friendly_token[0,20]

      return user
    end
  end
end
