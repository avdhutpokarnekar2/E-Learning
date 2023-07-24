# frozen_string_literal: true

# lesson controller
class LessonsController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    course_id = params[:course_id]
    @lessons = Lesson.where(course_id: course_id)
  end

  def show; end

  def new
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.build
  end

  def edit; end

  def create
    @lesson = Lesson.new(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to courses_path, notice: 'lesson was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_lesson_url(@lesson), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy if @lesson.present?

    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :course_id, :video)
  end
end
