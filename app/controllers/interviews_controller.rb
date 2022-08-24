class InterviewsController < ApplicationController
before_action :set_interview, only: [:show, :edit, :update, :destroy, :feedback, :submit_feedback, :edit_feedback]

  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, interview: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'interview was successfully updated.' }
        format.json { render :show, status: :ok, interview: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def feedback
    @interview_skill_ratings = @interview.interview_skill_ratings.present? ? @interview.interview_skill_ratings : @interview.interview_skill_ratings.build 
  end

  def submit_feedback
    respond_to do |format|
      if @interview.update(interview_skill_rating_params)
        format.html { redirect_to @interview, notice: 'Interview Feedback was successfully created.' }
        format.json { render :show, status: :created, interview: @interview }
      else
        format.html { render :feedback }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:candidate_id, :employee_id, :start_time, :end_time, :round, :remarks)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_skill_rating_params
      params.require(:interview).permit({ 
      interview_skill_ratings_attributes: [
          :core_skill_id, 
          :score,
          :id
        ] 
      })
    end
end
