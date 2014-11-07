module SessionsHelper
  def sign_in(user, remember_me = true)
    remember_token = SecureRandom.urlsafe_base64

    if remember_me
      cookies.permanent[:remember_token] = remember_token
    else
      cookies[:remember_token] = remember_token
    end
    user.update_attribute(:remember_token, Digest::SHA1.hexdigest(remember_token))

    self.current_user = user
  end

  def signed_in?
    current_user.present?
  end

  def sign_out
    current_user.update_attribute(:remember_token, nil)
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    return nil unless (remember_token = cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: Digest::SHA1.hexdigest(remember_token))
  end

  def current_user?(user)
    current_user == user
  end

  def signed_in_user
    return if signed_in?
    store_location

    flash[:warning] = 'Please sign in.'
    redirect_to signin_url
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
