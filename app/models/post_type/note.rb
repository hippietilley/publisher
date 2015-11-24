class Note < PostType
  fallback_attr :content

  def name
    pieces = content[0..50].split

    if (pieces.length == 1) || (pieces.join(" ").length <= 50)
      pieces
    else
      pieces[0..-2].join(" ")
    end
  end

  def fallback_name
    pieces = content[0..50].split

    if (pieces.length == 1) || (pieces.join(" ").length <= 50)
      pieces
    else
      pieces[0..-2].join(" ")
    end
  end

  def title
    nil
  end

  def subtitle
    nil
  end
end
