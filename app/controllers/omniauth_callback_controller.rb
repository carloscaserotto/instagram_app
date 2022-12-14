class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        #byebug
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            self_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
        else
            session["devise.twitter_data"] = request.env["omniauth.auth"].except("entra")
            redirect_to new_user_registration_url
        end
    end
    
    def failure
        redirect_to root_path
    end
end
  