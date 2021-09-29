class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[show update destroy]

  def index
    @instructors = Instructor.all
    json_response(@instructors)
  end

  def create
    @instructor = Instructor.create!(instructor_params)
    json_response(@instructor, :created)
  end

  def show
    json_response(@instructor)
  end

  def update
    @instructor.update(instructor_params)
    head :no_content
  end

  def destroy
    @instructor.destroy
    head :no_content
  end

  private

  def instructor_params
    params.permit(:name, :dragonType, :dragonName, :instImage, :dragonImage)
  end

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end
end
