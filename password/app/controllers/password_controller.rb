class PasswordController  < ApplicationController

  # Inside the method:
  #
  # Store the user ID and password in instance variables
  # Do some checks for whether they are valid; if they are, return with the String Credentials are acceptable, otherwise use the String Try again.
    def check
      # This checks the user id if exists
      if params.has_key?(:user_id) && !params[:user_id].strip.empty?
            cookies[:user] = params[:user_id]
      end
       @user_id = cookies[:user]

       # This checks the password if it exists
       if params.has_key?(:password) && !params[:password].strip.empty?
             cookies[:pass] = params[:password]
       end
        @password = cookies[:pass]

      if @password.length >= 6 &&
         @password.include?("#") || @password.include?("$") || @password.include?("!")
        @valid_password = "Acceptable Password!"
      else
        @valid_password = "Invalid Password!"
      end

      if @user_id.length >= 6 && !@user_id.include?("#") && !@user_id.include?("$") &&
      !@user_id.include?("!") &&
       @user_id != @password
       @valid_user_id = "Acceptable User ID"
     else
      @valid_user_id = "Invalid User ID"
     end
    end

end #end of class
