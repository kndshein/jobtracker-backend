class TimeInterviewsController < ApplicationController
    before_action :set_time_interview, only: [:updateInterview, :deleteInterview]
  
    # POST /job/:id/interview
    def createInterview
        @job = Job.find(params[:id])
        if @job.user_id == @user.id
            @interview = TimeInterview.new(interview_params.merge(job: @job))

            if @interview.save
                render json: @interview.to_json, status: :created
            else
                render json: @interview.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Job does not belong to User" }
        end
    end

    # PUT /interview/:id
    def updateInterview
        @job = Job.find(@interview.job_id)
        if @job.user_id == @user.id
            if @interview.update(interview_params)
                render json: @interview.to_json
            else
                render json: @interview.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Time Interview does not belong to User" }
        end
    end

    # DELETE /interview/:id
    def deleteInterview
        @job = Job.find(@interview.job_id)
        if @job.user_id == @user.id
            if @interview.destroy
                render json: { message: "Time Interview deleted"}
            else
                render json: @interview.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Time Interview does not belong to User" }
        end
    end
  
    private
      def set_time_interview
        @interview = TimeInterview.find(params[:id])
      end
  
      def interview_params
        params.require(:interview_info).permit(:name, :time)
      end
end
  