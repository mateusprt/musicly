class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]

  # GET /albums
  def index
    authorize Album
    @albums = Album.all
  end

  # GET /albums/1
  def show
    authorize Album
  end

  # GET /albums/new
  def new
    authorize Album
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
    authorize Album
  end

  # POST /albums
  def create
    authorize Album
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to album_url(@album), notice: "Album was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  def update
    authorize Album

    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to album_url(@album), notice: "Album was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  def destroy
    authorize Album
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:artist_id, :genre_id, :name, :release_date, :cover, :description)
    end
end
