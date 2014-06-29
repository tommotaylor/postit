module ApplicationHelper

  def fix_url(str)
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def nice_time(ts)
  	ts.strftime("on %e %b, %Y at %I:%M%P")
  end

end
