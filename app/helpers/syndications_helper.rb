module SyndicationsHelper

  def link_to_syndications(post)
    html = content_tag(:p, "Also posted to")
    links = []

    post.syndications.each do |syndication|
      rel = "external "
      rel << "syndication" if show_action?

      links << content_tag(:li, link_to(syndication.name, syndication.url), rel: rel, class: "u-syndication")
    end

    if links.blank?
      blank
    else
      html << content_tag(:ul, links.flatten.join.html_safe)
    end
  end

  def syndication_buttons_for(post)
    html = content_tag(:p, "Syndicate to")
    links = []

    current_user.providers.each do |provider|
      unless post.syndications.exists?(name: provider.provider)
        links << content_tag(:li, button_to(provider.provider, syndicators_path(post.namespace, post.id, :twitter), class: "link"))
      end
    end

    if links.blank?
      blank
    else
      html << content_tag(:ul, links.flatten.join.html_safe)
    end
  end

end
