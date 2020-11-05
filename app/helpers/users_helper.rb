module UsersHelper
  def profile_picture(user)
    image_path = user.image.thumb.url || "profile-placeholder.jpg"
  end
end
