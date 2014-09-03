module ApplicationHelper

  def fix_url(str)
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def nice_time(ts)
  	if logged_in? and !current_user.time_zone.blank?
  		ts = ts.in_time_zone(current_user.time_zone)
  	end

  	ts.strftime("on %e %b, %Y at %I:%M%P %Z")
  end

end
