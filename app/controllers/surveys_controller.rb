class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all.order(created_at: :DESC)
  end

  # GET /surveys/1 or /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @categories = Category.pluck(:title, :id).prepend(["", ""])
    @crops = Crop.pluck(:title, :id).prepend(["", ""])
  end

  # GET /surveys/1/edit
  def edit
    @categories = Category.pluck(:title, :id).prepend(["", ""])
    @crops = Crop.pluck(:title, :id).prepend(["", ""])
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @categories = Category.pluck(:title, :id).prepend(["", ""])
    @crops = Crop.pluck(:title, :id).prepend(["", ""])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to survey_url(@survey), notice: "アンケートが送信されました！" }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    @categories = Category.pluck(:title, :id).prepend(["", ""])
    @crops = Crop.pluck(:title, :id).prepend(["", ""])
    
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to survey_url(@survey), notice: "質問が更新されました！" }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "質問が削除されました！" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:title, :is_useful, :is_request, :category_id, :crop_id, :user_id)
    end
end
