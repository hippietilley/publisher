module ApplicationHelper
  def in_a_list?
    action_name == "index"
  end

  def on_permalink?
    action_name == "show"
  end

  def a_reply?(post)
    post.in_reply_to?
  end

  def link_to_in_reply_to_urls(post)
    links = []

    unless post.in_reply_to.blank?
      rel = on_permalink? ? "in-reply-to external" : "external"
      url_regex = %r{/https*:\/\//}
      post.in_reply_to.split.each do |url|
        links << link_to(url.sub(url_regex, ""), url, class: "u-in-reply-to h-cite", rel: rel)
      end
    end

    if links.length == 1
      links.first
    else
      list_items = []
      links.each do |link|
        list_items << content_tag(:li, link)
      end
      content_tag :ul, list_items.join.html_safe
    end
  end

  def small_word_tag(word)
    content_tag(:i, word, class: "small-word small-word-#{word}")
  end

  def preposition(text)
    content_tag(:span, text, class: "preposition")
  end

  def space
    " "
  end

  def tags_for(post)
    html = []

    separator = post.tags.match(",") ? "," : " "

    post.tags.split(separator).each do |tag|
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

  def license(format=:text)
    output = []
    output << license_name_and_url(format)
    output << license_years_range
    output << authors_name_and_url(format)
    output.join(format == :html ? " " : "\n").html_safe
  end

  def license_name_and_url(format=nil)
    output  = []
    license = License.find(setting(:license))

    if license.name == "All Rights Reserved"
      # Default
      output << "#{license.name} #{license.short_code}"
    else
      # Creative Commons and Public Domain (CC0)
      if format == :html
        output << link_to("#{license.name} (#{license.short_code})", license.url, rel: "license")
      else
        output << "#{license.name} (#{license.short_code})"
        output << license.url
      end
    end

    output
  end

  def license_years_range
    output  = []
    years_range = Time.now.year

    # first_post      = Post.first
    # first_post_year = first_post.nil? ? years_range : first_post.published_at.year

    # if first_post_year == years_range
    #   output << years_range
    # else
    #   output << "#{first_post_year}&ndash;#{years_range}"
    # end

    # remove this line after the above is TODO(ne)
    output << years_range
  end

  def authors_name_and_url(format=nil)
    # TODO: use name after /profile is expanded
    # TODO: use current_user.url (? about page) after /profile is expanded
    if format == :html
      link_to(current_user.email , root_url, class: "p-author h-card")
    else
      current_user.email
    end
  end

  def setting(key)
    Setting.where(key: key).first.content
  end
end
