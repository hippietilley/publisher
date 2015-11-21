class Photo < PostType
  fallback_attr :image_url

  def enclosure_url
    image_url
  end
end
