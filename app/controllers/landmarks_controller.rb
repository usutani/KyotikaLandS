class LandmarksController < ApplicationController
  before_action :set_landmark, only: [:show, :edit, :update, :destroy]

  # GET /landmarks
  # GET /landmarks.json
  def index
    @landmarks = Landmark.all
  end

  # GET /landmarks/1
  # GET /landmarks/1.json
  def show
  end

  # GET /landmarks/new
  def new
    @landmark = Landmark.new
  end

  # GET /landmarks/1/edit
  def edit
  end

  # POST /landmarks
  # POST /landmarks.json
  def create
    @landmark = Landmark.new(landmark_params.except(:tag_names))
    @landmark.add_tags(landmark_params[:tag_names])

    respond_to do |format|
      if @landmark.save
        format.html { redirect_to @landmark, notice: 'Landmark was successfully created.' }
        format.json { render :show, status: :created, location: @landmark }
      else
        format.html { render :new }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landmarks/1
  # PATCH/PUT /landmarks/1.json
  def update
    @landmark.taggings.destroy_all
    @landmark.add_tags(landmark_params[:tag_names])

    respond_to do |format|
      if @landmark.update(landmark_params.except(:tag_names))
        format.html { redirect_to @landmark, notice: 'Landmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @landmark }
      else
        format.html { render :edit }
        format.json { render json: @landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landmarks/1
  # DELETE /landmarks/1.json
  def destroy
    @landmark.destroy
    respond_to do |format|
      format.html { redirect_to landmarks_url, notice: 'Landmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landmark
      @landmark = Landmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landmark_params
      params.require(:landmark).permit(:name, :hiragana, :latitude, :longitude, :url, :question, :answer1, :answer2, :answer3, :correct, :author, :tag_names)
    end
end
