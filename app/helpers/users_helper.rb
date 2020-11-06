module UsersHelper
  def profile_picture(user, width = 100)
    image_path = user.image.thumb.url || "profile-placeholder.jpg"
    image_tag(image_path, width: width, class: "img-circle")
  end
end
