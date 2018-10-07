module LoginHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    if session[:user_id]
      @current_user ||= Account.find_by(id: session[:user_id])
    end
  end
  def logged_in?
    @current_user = current_user
    if @current_user.nil?
      return false
    else
      return true
    end
  end
end
