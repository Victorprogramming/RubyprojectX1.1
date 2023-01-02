class OmniauthCallbacksController < ApplicationController 
    def twitter 
        Rails.logger.info auth

       Current.user.twitter_accounts.create(
        name: auth.info.name,
        username: auth.info.username ,
        image: auth.info.image,
        token: auth.info.token,
        secret: auth.info.secret,
       )

       redirect_to root_path, notice: "Succsessfully connected your account to Twitter"
    end
    def auth 
        request.env['omniauth.auth']
    end
end