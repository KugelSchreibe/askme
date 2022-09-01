module UsersHelper
  DEF_HEAD_COLOR = '#0BA5BE'

  def fnickname(nickname)
    "@#{nickname}"
  end

  def header_color_checking(user)
    user&.header_color || DEF_HEAD_COLOR
  end
end
