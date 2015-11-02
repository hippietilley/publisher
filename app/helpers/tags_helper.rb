module TagsHelper
  def private_tag?(tag)
    tag.name.match(/^\./)
  end

  def link_to_tags_for(post)
    html = []

    post.tags.each do |tag|
      if private_tag?(tag)
        if signed_in?
          html << link_to_tag(tag)
        end
      else
        html << link_to_tag(tag)
      end
    end

    html.join(", ").html_safe
  end

  def link_to_tag(tag)
    link_to(tag.name, tag_path(tag.slug), class: "p-category", rel: "tag")
  end
end
