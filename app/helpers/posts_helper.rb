module PostsHelper
  def rel_in_reply_to
    on_permalink? ? "in-reply-to external" : "external"
  end

  def link_to_in_reply_to_urls(post)
    links = []
    protocol_regex = %r{/https*:\/\//}

    unless post.in_reply_to.blank?
      post.in_reply_to.split.each do |url|
        links << link_to(url.sub(protocol_regex, space), url, class: "u-in-reply-to h-cite", rel: rel_in_reply_to)
      end
    end

    content_tag :ul do
      links.map { |link| concat(content_tag(:li, link)) }
    end
  end

  def tags_for(post)
    separator = post.tags.match(",") ? "," : " "
    post.tags.split(separator).map(&:strip)
  end

  def link_to_tags_for(post)
    html = []

    tags_for(post).each do |tag|
      html << link_to(tag.to_s.strip, "/tags/#{tag.to_s.gsub(/\s/, '+')}", class: "p-category", rel: "tag")
    end
    html.join(", ").html_safe
  end

  def human_readable_date(datetime)
    datetime.strftime("%F")
  end

  def human_readable_time(datetime)
    datetime.strftime("%l:%M%p").downcase
  end

  def authors_name_and_url(format = nil)
    # TODO: use current_user.url (? about page) after /profile is expanded
    if format == :html
      link_to(@owner.name, root_url, class: "p-author h-card")
    else
      @owner.name
    end
  end

  def canonical_url(post = nil)
    # TODO: refactor out complexity
    path =
    if @slug == "profile"
      "profile"
    elsif action_name == "new"
      "/#{controller_name}/new"
    elsif @slug != "settings" && @slug != "links" && action_name == "edit"
      "#{post.path}/edit"
    elsif post
      post.path
    elsif @slug == "home"
      "/"
    elsif @slug
      "/#{@slug}"
    end

    site_url + path
  end

  def rel_canonical_link_tag(post = nil)
    tag(:link, id: "canonical", rel: "canonical", type: "text/html", href: canonical_url(post))
  end
end
