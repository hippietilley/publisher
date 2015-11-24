class Page < PostType
  fallback_attr :content

  def fallback_name
    pieces = content[0..50].split

    if (pieces.length == 1) || (pieces.join(" ").length <= 50)
      pieces
    else
      pieces[0..-2].join(" ")
    end
  end

  def in_reply_to?
    false
  end

  def post_type_type
    self.class.to_s
  end
end
