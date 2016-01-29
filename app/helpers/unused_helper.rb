module UnusedHelper
  # def shorturl_link_tag(post)
  #   if index_action?
  #     url = "http://#{setting :short_domain}/#{setting :post_short_code}"
  #   elsif show_action?
  #     url = short_url(post)
  #   else
  #     url = "http://#{setting :short_domain}"
  #   end
  #
  #   tag(:link, id: "shortlink", rel: "shortlink", type: "text/html", href: url)
  # end
  #
  # def short_url(post)
  #   pieces =  [setting :post_short_code]
  #
  #   pieces << Date.parse("#{post.year}-#{post.month}-#{post.day}").to_sxg
  #   pieces << nth_of_day(post)
  #
  #   "http://#{setting :short_domain}/#{pieces.join}"
  # end
  #
  # def nth_of_day(post)
  #   nth = Post.where(
  #           year:  post.year,
  #           month: post.month,
  #           day:   post.day
  #         ).all.sort_by{|n| n.published_at}.index(post) + 1
  #
  #   if nth.nil?
  #     nth = 1
  #   end
  #
  #   nth.to_sxg
  # end
  #
  # def autofocus_value
  #   !editing?
  # end
  # 
  # def tag_url(tag)
  #   site_url + "/tags/" + tag.gsub(/ /, "+")
  # end
end
