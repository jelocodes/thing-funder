class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  	super
  	if resource.save 
  		User.last.update(user_params)
  		current_user = User.last
	  end
  end

  def update
    super
  end

  private 

  def user_params 
  	params.require(:user).permit(:username, :bio, :twitter, :facebook, :website)
  end

end 