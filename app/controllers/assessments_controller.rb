# frozen_string_literal: true

# controller assessment
class AssessmentsController < ApplicationController
  before_action :set_assessment, only: %i[show edit update destroy]

  # GET /assessments or /assessments.json
  def index
    @assessments = Assessment.all
    authorize @assessments
  end

  # GET /assessments/1 or /assessments/1.json
  def show; end

  # GET /assessments/new
  def new
    course = Course.find(params[:id])
    @@course = course
    @assignment = course.assignment
    @questions = @assignment.questions if @assignment.present?
    @assessment = Assessment.new
  end

  # GET /assessments/1/edit
  def edit; end

  # POST /assessments or /assessments.json
  def create
    if assessment_params[:question_set].present?
      question = assessment_params[:question_set]
      count = 0
      question.each do |key, value|
        current_question = Question.find(key)
        count += 1 if current_question.answer == value
      end
      params[:assessment][:grade] = count
    end
    @assessment = Assessment.new(assessment_params)
    respond_to do |format|
      if @assessment.save
        certificate
        format.html { redirect_to assessment_url(@assessment), notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  def certificate
    grade = params[:assessment][:grade]
    user_id = params[:assessment][:user_id]
    course = @@course
    assignment_id = params[:assessment][:assignment_id]
    Course.where(assignment_id: assignment_id)
    Certificate.create(grade: grade, user_id: user_id, course_id: course.id)
  end

  # PATCH/PUT /assessments/1 or /assessments/1.json
  def update
    authorize @assessment
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to assessment_url(@assessment), notice: 'Assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1 or /assessments/1.json
  def destroy
    @assessment.destroy
    authorize @assessment
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assessment_params
    params.require(:assessment).permit(:grade, :assignment_id, :user_id, question_set: {})
  end
end
