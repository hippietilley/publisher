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

      post.in_reply_to.split.each do |url|
        links << link_to(url.sub(/https*:\/\//, ""), url, class: "u-in-reply-to h-cite", rel: rel)
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
      html << link_to(tag.to_s.strip, "/tags/#{tag.to_s.gsub(/ /, "+")}", class: "p-category", rel: "tag")
    end
    html.join(", ").html_safe
  end

  def human_readable_date(datetime)
    datetime.strftime("%F")
  end

  def human_readable_time(datetime)
    datetime.strftime("%l:%M%p").downcase
  end
end
