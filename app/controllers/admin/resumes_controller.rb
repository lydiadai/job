class Admin::ResumesController < ApplicationController
before_action :authenticate_user!
before_action :require_is_admin
layout "aadmin"
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.recent.paginate(:page => params[:page], :per_page =>8)
  end

end
