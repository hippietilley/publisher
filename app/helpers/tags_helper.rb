module TagsHelper
  def link_to_tags_for(post)
    html = []

    post.tags.each do |tag|
      if tag.private_tag?
        html << link_to_tag(tag) if signed_in?
      else
        html << link_to_tag(tag)
      end
    end

    html.join(", ").html_safe
  end

  def link_to_tag(tag)
    link_to_unless_current(tag.name, tag_path(tag.slug), class: "p-category", rel: "tag")
  end

  def link_to_external_tag_pages(tag)
    links = []

    {
      Facebook: "https://www.facebook.com/hashtag/",
      Flickr: "https://www.flickr.com/photos/tags/",
      Instagram: "https://www.instagram.com/explore/tags/",
      Twitter: "https://twitter.com/hashtag/",
      Vimeo: "https://vimeo.com/categories/",
      Vine: "https://vine.co/tags/",
    }.each do |site, url|
      links << link_to(site, url + tag.slug)
    end

    links.join(", ").html_safe
  end
end
