# frozen_string_literal: true

class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show; end

  def new
    @lesson = Lesson.new
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
        format.html { redirect_to lesson_url(@lesson), notice: 'lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy

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