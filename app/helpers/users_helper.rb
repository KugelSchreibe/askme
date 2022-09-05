module UsersHelper
  def fnickname(nickname)
    "@#{nickname}"
  end

  def header_color_checking(user)
    user&.header_color || User.DEFAULT_HEADER_COLOR
  end

  def user_profile_path(user)
    "/users/#{user.nickname}"
  end

  def user_edit_profile_path(user)
    "/users/#{user.nickname}/edit"
  end

  def user_update(user)
    "/users/#{user.nickname}"
  end
end
