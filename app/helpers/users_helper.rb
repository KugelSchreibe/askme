module UsersHelper
  def fnickname(nickname)
    "@#{nickname}"
  end


  def header_color_checking(user)
    user&.header_color || '#0BA5BE'
  end
end
