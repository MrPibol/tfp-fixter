class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_enrollment_for_viewing_lesson, only: [:show]
    def show
    end
    
    private
    helper_method :current_lesson
    def current_lesson
        @current_lesson ||= Lesson.find(params[:id])
    end
    
    def require_enrollment_for_viewing_lesson
        if !current_user.enrolled_in?(current_lesson.section.course)
            flash[:notice] = "Enrollment to the course is required"
            redirect_to course_path(current_lesson.section.course)
        end
    end
end
