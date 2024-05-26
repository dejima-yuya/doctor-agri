class SurveysController < ApplicationController
  before_action :set_survey, only: %i(show edit update destroy)
  before_action :set_q, only: %i(index)
  before_action :check_admin, only: %i(index edit update show destroy analysis)

  # GET /surveys or /surveys.json
  def index
    @q = Survey.ransack(params[:q])
    @surveys = @q.result(distinct: true).all.order(created_at: :DESC).page(params[:page]).per(10)
    @surveys = @surveys.search_by_user_name(params[:q]&.[](:user_name)) if params[:q]&.[](:user_name).present?
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
    @survey.user_id = current_user.id
    @categories = Category.pluck(:title, :id).prepend(["", ""])
    @crops = Crop.pluck(:title, :id).prepend(["", ""])

    respond_to do |format|
      if @survey.save
        # メール送信設定
        # if @survey.is_request == true
        #   SurveyMailer.with(to: "jimajapan.g3@gmail.com", name: "出島").notify_admin.deliver_now
        # end
        format.html { redirect_to root_path, notice: "アンケートが送信されました！" }
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
        format.html { redirect_to survey_url(@survey), notice: "アンケートが更新されました！" }
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
      format.html { redirect_to surveys_url, notice: "アンケートが削除されました！" }
      format.json { head :no_content }
    end
  end

  def analysis
    @category_rankings = Survey.category_ranking
    @crop_rankings = Survey.crop_ranking
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

    def set_q
      @q = Survey.ransack(params[:q])
    end
end
