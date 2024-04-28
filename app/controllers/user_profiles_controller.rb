class UserProfilesController < ApplicationController
  def new
    @user_profiles = UserProfile.new
  end

  def create
    @user_profile = UserProfile.new(user_params)
    @user_profile.pictures.build(image: params[:user_profile][:image])
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_back fallback_location: root_path   , notice: "User profile was successfully updated." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user_profile).permit(:name, :user_id, :address, :phone)
  end
end
