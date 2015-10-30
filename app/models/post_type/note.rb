class Note < PostType
  fallback_attr :content

  def name
    pieces = content[0..50].split
    if pieces.length == 1
      pieces
    else
      pieces[0..-1].join(" ")
    end
  end

  def fallback_name
    pieces = content[0..50].split
    pieces[0..-1].join(" ")
  end

  def title
    content
  end

  def tags
    output = []
    
    Tagging.where(post_type: "note", post_id: id).all.each do |tagging|
      output << Tag.find(tagging.tag_id)
    end

    output
  end
end
