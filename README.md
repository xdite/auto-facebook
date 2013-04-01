# AutoFacebook

Easy to mount omniauth-facebook to Rails 

## Installation

Add these lines to your application's Gemfile:

    gem "omniauth"
    gem "omniauth-facebook"
    gem "auto-facebook"

And then execute:

    $ bundle

## Install

    1. rails g auto_facebook:user
    2. rake db:migrate
    3. rails g auto_facebook:install
    4. touch tmp/restart.txt

## Config

Edit `config/config.yml` # If you use [SettingsLogic](https://github.com/binarylogic/settingslogic)

add:

    facebook_app_id:  'APP_ID'
    facebook_secret: 'APP_SECRET'
    
    
## Other

``` rhtml

 <%= link_to("Facebook Login", Setting.domain + user_omniauth_authorize_path(:facebook), :class => "btn btn-facebook") %>    
 
``` 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
