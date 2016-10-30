class JobsController < ApplicationController

  def index
    @jobs = Job.where(:is_hidden => false).recent.paginate(:page => params[:page],:per_page => 10)
  end

  def show
  @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
  end
end
