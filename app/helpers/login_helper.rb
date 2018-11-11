require 'sanitize'
module LoginHelper
  #require 'sanitize'
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
  def compare_users(book_seller)
    @current_user = current_user
    p @current_user
    seller_domain = book_seller.email[/(?<=@)[^.]+(?=\.)/].to_s.downcase
    p seller_domain
    if !@current_user.nil?
    buyer_domain = @current_user.email[/(?<=@)[^.]+(?=\.)/].to_s.downcase
    p buyer_domain
    end
    if seller_domain == buyer_domain
      return true
    else
      return false
    end
  end
  def contact_info_display(compare, book_seller)
    format1="<a class='ui basic small green button' href='mailto:#{book_seller.email}'>Email Seller: #{book_seller.email}</a>"
    format2='<p>Not same university - no contact info displayed</p>'
    format3='<a href="/login">Please login to view email</a>'

    if logged_in? && compare
      return Sanitize.fragment(format1, Sanitize::Config::RELAXED)
    elsif logged_in? && !compare
      return Sanitize.fragment(format2, Sanitize::Config::RELAXED)
    else
      return Sanitize.fragment(format3, Sanitize::Config::RELAXED)
    end
  end

  # def html_message(compare)
  #   message1="Email Seller: <%=book.seller.email%>"
  #   message2="Not same university - no contact info displayed"
  #   message3="Login to view contact info"
  #
  #   if logged_in? && compare
  #     return message1.sanitize
  #   elsif logged_in? && !compare
  #     return message2.sanitize
  #   else
  #     return message3.sanitize
  #   end
  #
  # end
  # def html_close_tag(compare)
  #
  #   close_tag1 ="a"
  #   close_tag2 ="p"
  #
  #   if compare || !logged_in?
  #     return close_tag1.sanitize
  #   else
  #     return close_tag2.sanitize
  #   end
  # end
end