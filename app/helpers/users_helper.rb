module UsersHelper
  def fnickname(nickname)
    "@#{nickname}"
  end

  def default_header_color
    '#0BA5BE'
  end

  def header_color_checking(user)
    if user.present?
      user.header_color
    else
      default_header_color
    end
  end
end
