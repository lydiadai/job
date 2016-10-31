class JobsController < ApplicationController

  def index
    @jobs = case params[:order]
    when 'by_wage_upper_bounder'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page],:per_page => 10)
    when 'by_wage_lower_bounder'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page],:per_page => 10)
    else
      Job.published.recent.paginate(:page => params[:page],:per_page => 10)
    end
  end

  def show
  @job = Job.find(params[:id])

  if @job.is_hidden
    flash[:warning]="This Job is archeived"
    redirect_to root_path
  end

  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:wage_upper_bound,:wage_lower_bound,:contact_email,:is_hidden)
  end
end
