class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]

  # GET /artists
  def index
    authorize Artist
    @artists = Artist.all
  end

  # GET /artists/1
  def show
    authorize Artist
  end

  # GET /artists/new
  def new
    authorize Artist
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    authorize Artist
  end

  # POST /artists
  def create
    authorize Artist

    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to artist_url(@artist), notice: "Artist was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  def update
    authorize Artist

    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to artist_url(@artist), notice: "Artist was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  def destroy
    authorize Artist
    
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url, notice: "Artist was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:genre_id, :name, :birth_date, :biography, images: [])
    end
end
