module ApplicationHelper
  def formatear_fecha fecha
    l fecha.to_date
  end

  def yes_no_icon(bool)
    if bool
       '<i class="icon-ok"></i>'.html_safe
    else
       '<i class="icon-remove"></i>'.html_safe
    end
  end
end
