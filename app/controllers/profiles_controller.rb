class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles
  def index
    authorize Profile
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
    authorize @profile
  end

  # GET /profiles/new
  def new
    authorize Profile
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    authorize @profile
  end

  # POST /profiles
  def create
    authorize Profile
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:role, :name)
    end
end
