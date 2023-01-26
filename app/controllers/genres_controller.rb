class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show edit update destroy ]

  # GET /genres
  def index
    authorize Genre
    @genres = Genre.all
  end

  # GET /genres/1
  def show
    authorize Genre
  end

  # GET /genres/new
  def new
    authorize Genre
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
    authorize Genre
  end

  # POST /genres
  def create
    authorize Genre
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to genre_url(@genre), notice: "Genre was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genres/1
  def update
    authorize Genre

    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to genre_url(@genre), notice: "Genre was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  def destroy
    authorize Genre
    
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to genres_url, notice: "Genre was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
