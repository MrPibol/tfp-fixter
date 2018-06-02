class Instructor::LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_section, only: [:new, :create]  
    before_action :require_authorized_for_current_lesson, only: [:update]  
    
    def new
        if current_section.course.user != current_user
            return render plain: "Unauthorized", status: :unauthorized
        end
        @lesson = Lesson.new
    end
    
    def create
        
        if current_section.course.user != current_user
            return render plain: "Unauthorized", status: :unauthorized
        else
            @lesson = current_section.lessons.create(lesson_params)
            if !@lesson.valid?
                render :new, status: :unprocessable_entity 
            end
            redirect_to instructor_course_path(current_section.course)
        end
    end
    
    def update
        current_lesson.update_attributes(lesson_params)  
        render plain: 'updated!'
    end 
    
    private
    
    def current_lesson
        current_lesson ||= Lesson.find(params[:id])
    end
    helper_method :current_section
    def current_section
        @current_section ||= Section.find(params[:section_id])
        
        # if @current_section == nil
        #     @current_section = Section.find(params[:section_id])
        #     @current_section
        # else
        #     @current_session
        # end   ----> this section is replaced with @current_section ||= Section.find(params[:section_id])
    end
    
    def lesson_params
        params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
    end
    
    def require_authorized_for_current_section
        if current_section.course.user != current_user
            render plain: 'Unauthorized', status: :unauthorized
        end
    end
    
    def require_authorized_for_current_lesson
        if current_lesson.section.course.user != current_user
            render plain: 'Unauthorized', status: :unauthorized
        end
    end
end
