module ApplicationHelper

  def fix_url(str)
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def nice_time(ts)
  	ts.strftime("%I:%M%P on %m/%d/%y")
  end

end
