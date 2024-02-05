module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    # session（railsのデフォルト機能）の参考
    # https://qiita.com/ozackiee/items/4ee774c81b2a0c571c05
    session.delete(:user_id)
    @current_user = nil
  end
end
