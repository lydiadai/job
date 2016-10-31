module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      link_to(content_tag(:span,"",:class => "fa fa-lock"),publish_admin_job_path(job), :method => :post, :class => "btn btn-xs ")
    else
      link_to(content_tag(:span,"",:class => "fa fa-globe"),hide_admin_job_path(job), :method => :post, :class => "btn btn-xs ")
    end
  end
end
