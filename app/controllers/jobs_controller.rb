class JobsController < ApplicationController
  before_action :set_job, only: [:updateJob, :deleteJob]

  # POST /job/create
  def createJob
    @job = Job.new(job_params.merge(user: @user))

    if @job.save
      render json: @job.to_json(:except => :user_id), status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PUT /job/:id
  def updateJob
    p "POOP", @job
    if @job.user_id == @user.id
        if @job.update(job_params)
            render json: @job.to_json(:except => :user_id)
        else
            render json: @job.errors, status: :unprocessable_entity
        end
    else
        render json: { message: "Job does not belong to User"}
    end
  end

  # DELETE /job/:id
  def deleteJob
    if @job.user_id == @user.id
      if @job.destroy
        render json: { message: "Job deleted" }
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "Job does not belong to User" }
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job_info).permit(:status, :job_title, :job_industry, :company_name, :date_applied, :time_phonescreen, :date_offered, :date_accepted, :date_companyrejection, :date_userrejection, :job_description, :resume, :coverletter, :location_city, :location_state)
    end
end
