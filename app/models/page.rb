class Page < PostType
  def in_reply_to?
    false
  end

  def post_type_type
    self.class.to_s
  end
end
