class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        # @old_user = User.find_by(email: @user.email)
        # if !@old_user
        sign_in_and_redirect @user 
        # else
        #  redirect_to new_user_registration_path,:notice => "This E-mail: #{@user.email} registered before!"
        # end
    end

    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        # @old_user = User.find_by(email: @user.email)
        # if !@old_user
        sign_in_and_redirect @user
        # else
        #  redirect_to new_user_registration_path,:notice => "This E-mail: #{@user.email} registered before!"
        # end
    end

    def github
                # binding.pry

        @user = User.from_omniauth(request.env["omniauth.auth"])
        # @old_user = User.find_by(email: @user.email)
        # if !@old_user
        sign_in_and_redirect @user
        # else
        #  redirect_to new_user_registration_path,:notice => "This E-mail: #{@user.email} registered before!"
        # end
    end
end