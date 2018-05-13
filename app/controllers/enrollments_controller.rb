class EnrollmentsController < ApplicationController
    def create
        @enrollment = current_user.enrollments.create(course: current_course)
       if @enrollment.valid?
           redirect_to course_path(current_course)
       else
            render :new, status: :unprocessable_entity
       end
    end
    
  private
  helper_method :current_course
  def current_course
      current_course ||= Course.find(params[:course_id]) 
  end

end