module TagsHelper
  def private_tag?(tag)
    tag.match(/^\./)
  end

  def tags_for(post)
    separator = post.tags.match(",") ? "," : " "
    post.tags.split(separator).map(&:strip)
  end

  def link_to_tags_for(post)
    html = []

    tags_for(post).each do |tag|
      if private_tag?(tag)
        if signed_in?
          html << link_to(tag.to_s.strip, "/tags/#{tag.to_s.gsub(/\s/, '+')}", class: "p-category", rel: "tag")
        end
      else
        html << link_to(tag.to_s.strip, "/tags/#{tag.to_s.gsub(/\s/, '+')}", class: "p-category", rel: "tag")
      end
    end

    html.join(", ").html_safe
  end
end
