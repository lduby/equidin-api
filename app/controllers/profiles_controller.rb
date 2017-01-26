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
  	puts "Creating profile with "+params["profile"].inspect
    #@profile = Profile.new(profile_params)
    @profile = Profile.new(allowed_params)

    if @profile.save
      render_create_success(@profile)
    else
      render_create_error(@profile)
    end
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(profile_params)
      render_update_success(@profile)
    else
      render_update_error(@profile)
    end
  end

  #def destroy
  #  @profile.destroy
  #  head 204
  #end

  protected

  def render_create_success(resource)
    render json: {
      status: 'success',
      data:   resource, 
      message: 'Profile created'
    }
  end

  def render_update_success(resource)
    render json: {
      status: 'success',
      data:   resource, 
      message: 'Profile updated'
    }
  end

  def render_create_error(resource)
  	render_error(resource, :unprocessable_entity, 'Profile not created: check the form.')
    # render json: {
    #   status: :unprocessable_entity,
    #   data:   resource, 
    #   message: 'Profile not created: check the form.'
    # }
  end

  def render_update_error(resource)
  	render_error(resource, :unprocessable_entity, 'Profile not updated: check the form.')
    # render json: {
    #   status: :unprocessable_entity,
    #   data:   resource, 
    #   message: 'Profile not updated: check the form.'
    # }
  end


  private

  def profile_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  def allowed_params
  	params.require("profile").permit(:id, :name, :phone, :address, :about, :picture, :riding_level, :user_id)
  end
end
