module ApplicationHelper
  def writing?
    action_name =~ /new|edit/
  end

  def editing?
    action_name == "edit"
  end

  def in_a_list?
    action_name == "index"
  end

  def on_permalink?
    action_name == "show"
  end

  def a_reply?(post)
    post.in_reply_to?
  end

  def license(format = nil)
    output = []
    output << license_name_and_url(format)
    output << license_years_range
    output << authors_name_and_url(format)
    output.flatten.join(format == :html ? " " : "\n").html_safe
  end

  def license_name_and_url(format = nil)
    license = License.find(setting(:license))

    if license.name == "All Rights Reserved"
      # Default
      "#{license.name} #{license.short_code}"
    elsif format == :html
      # Creative Commons and Public Domain (CC0) as HTML
      link_to("#{license.name} (#{license.short_code})", license.url, rel: "license")
    else
      # Creative Commons and Public Domain (CC0) as plain text
      ["#{license.name} (#{license.short_code})", license.url]
    end
  end

  def license_years_range
    output = []
    years_range = Time.now.in_time_zone.year

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

  def site_title
    title = ""

    # TODO
    # if setting(:site_title).blank?
    #   title << post_type.capitalize.pluralize
    # else
    title << setting(:site_title)
    # end

    title << " - #{@page_title}" if @page_title

    title.html_safe
  end

  def page_description
    if in_a_list?
      # TODO: use current_user.name after /profile is expanded
      # TODO: implement #post_type: notes, articles, photes, etc
      page_description = "TODO: post_type.pluralize.capitalize by #{current_user.try(:email)}"
    elsif on_permalink?
      page_description = @post.content
    else
      page_description = setting(:site_description)
    end

    page_description
  end

  def apple_touch_icon_link_tags
    output = []

    # square pixel sizes
    sizes = [180, 152, 144, 120, 114, 72, 76, 60, 57]
    sizes.each do |size|
      dimensions = "#{size}x#{size}"
      href       = "/apple-touch-icon-#{dimensions}.png"
      output << tag(:link, rel: "apple-touch-icon", sizes: dimensions, href: href)
    end

    output.join("\n").html_safe
  end

  def site_url
    setting(:protocol) + setting(:domain)
  end
end
