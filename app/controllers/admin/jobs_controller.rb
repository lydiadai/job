class Admin::JobsController < ApplicationController
    before_action :authenticate_user!, only:[:new,:create, :edit, :destroy, :update]
    before_action :find_job, only:[:edit, :show, :update, :destroy,:hide,:publish]
    before_action :require_is_admin
    layout "aadmin"
    def index
      @jobs = Job.all.recent.paginate(:page => params[:page],:per_page => 10)
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
    def hide
      @job.hide!
      redirect_to :back
    end
    def publish
      @job.publish!
      redirect_to :back
    end

    private

    def find_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
    end

end
