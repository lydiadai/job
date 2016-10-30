class Admin::JobsController < ApplicationController
    before_action :authenticate_user!, only:[:new,:create, :edit, :destroy, :update]
    before_action :find_job, only:[:edit, :show, :update, :destroy]
    before_action :require_is_admin
    def index
      @jobs = Job.all
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
      @job.user = current_user
      if @job.save
        redirect_to admin_jobs_path
      else
        render :new
      end
    end

    def edit

    end

    def update
      if @job.update(job_params)
        redirect_to admin_jobs_path,notice:"Update Success"
      else
        render :edit
      end
    end

    def show

    end

    def destroy
      @job.destroy
      redirect_to admin_jobs_path,alert:"Job Deleted"
    end

    private

    def find_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email)
    end

end
