class ProfilesController < ApplicationController
  #def show
  # 	@profile = Profile.find(params[:id])
  #	respond_to :js
  #end
  def find_user_profile
  	@profile = User.find(params[:id]).profile
  	render json: @profile 
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created 
    else
      render_error(@profile, :unprocessable_entity)
    end
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(profile_params)
      render json: @profile, status: :ok
    else
      render_error(@profile, :unprocessable_entity)
    end
  end

  #def destroy
  #  @profile.destroy
  #  head 204
  #end


  private

  def profile_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
