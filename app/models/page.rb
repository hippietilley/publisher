class Page < PostType
  fallback_attr :content

  def fallback_name
    content[0..50].split[0..-2].join(" ")
  end

  def in_reply_to?
    false
  end

  def post_type_type
    self.class.to_s
  end
end
