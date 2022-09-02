module UsersHelper
  def fnickname(nickname)
    "@#{nickname}"
  end

  def header_color_checking(user)
    user&.header_color || User.DEFAULT_HEADER_COLOR
  end
end
