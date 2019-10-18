class  Users::RegistrationsController <    Devise::RegistrationsController
  before_action :prohibit_google_user, only: [:edit,:update,:create]
   private 
   
   def prohibit_google_user  
      if current_user.provider 
        redirect_to user_path(current_user), notice: "アクセスできません"
      end
   end
end