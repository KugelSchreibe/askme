class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :select_hashtags
  helper_method :find_hashtag_by_body

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: 'Вам сюда нельзя!'
  end

  def select_hashtags(text)
    text.scan(/#[\wА-Яа-яЁё]+/).map { |tag| tag[1..-1] }
  end
end
