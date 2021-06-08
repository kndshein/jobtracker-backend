class TimelineTimesController < ApplicationController
    before_action :set_timeline_time, only: [:updateTime, :deleteTime]
  
    # POST /job/:id/time
    def createTime
        @job = Job.find(params[:id])
        if @job.user_id == @user.id
            @time = TimelineTime.new(timeline_params.merge(job: @job))

            if @time.save
                render json: @time.to_json, status: :created
            else
                render json: @time.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Job does not belong to User" }
        end
    end

    # PUT /time/:id
    def updateTime
        @job = Job.find(@time.job_id)
        if @job.user_id == @user.id
            if @time.update(timeline_params)
                render json: @time.to_json
            else
                render json: @time.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Timeline Time does not belong to User" }
        end
    end

    # DELETE /time/:id
    def deleteTime
        @job = Job.find(@time.job_id)
        if @job.user_id == @user.id
            if @time.destroy
                render json: { message: "Timeline Time deleted"}
            else
                render json: @time.errors, status: :unprocessable_entity
            end
        else
            render json: { message: "Timeline Time does not belong to User" }
        end
    end
  
    private
      def set_timeline_time
        @time = TimelineTime.find(params[:id])
      end
  
      def timeline_params
        params.require(:timeline_info).permit(:name, :time)
      end
end
  