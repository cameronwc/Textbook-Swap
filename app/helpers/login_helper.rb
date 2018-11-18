require 'sanitize'
# The LoginHelper has many functions that supplement the LoginController including
# log_in - performs the fundamental task of a log in - sets session variable
# login_compare - helps the check function in the controller determine what to do when the password is either correct or incorrect
# logged_in? - checks if a user is logged in
# compare_users - compares a user with the logged in user to see if thy are from the same university
# contact_info_display

module LoginHelper
  #require 'sanitize'
  def log_in(user)
      session[:user_id] = user.id
  end
  def login_compare(user, input)
    if user.authenticate(input)
      log_in user
      @current_user = current_user
      return "/"
    else
      flash.alert = "Error please check your username and password."
      return "/login"
    end
  end
  def current_user
    session_user = session[:user_id]
    if session_user
      @current_user ||= Account.find_by(id: session_user)
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
  def compare_users(book_seller)
    @current_user = current_user
    seller_domain = book_seller.email[/(?<=@)[^.]+(?=\.)/].to_s.downcase
    if logged_in?
    buyer_domain = @current_user.email[/(?<=@)[^.]+(?=\.)/].to_s.downcase
    end
    if seller_domain == buyer_domain
      return true
    else
      return false
    end
  end
  def contact_info_display(compare, email)
    demail="<a class='ui basic small green button' href='mailto:#{email}'>Email Seller: #{email}</a>"
    dmessage='<p>Not same university - no contact info displayed</p>'
    dlogin='<a href="/login">Please login to view email</a>'
    if logged_in? && compare
      return Sanitize.fragment(demail, Sanitize::Config::RELAXED)
    elsif logged_in? && !compare
      return Sanitize.fragment(dmessage, Sanitize::Config::RELAXED)
    else
      return Sanitize.fragment(dlogin, Sanitize::Config::RELAXED)
    end
  end
end