class Article < PostType
  fallback_attr :content

  def fallback_name
    if (pieces.length == 1) || (pieces.join(" ").length <= 50)
      pieces
    else
      pieces[0..-2].join(" ")
    end
  end
end
