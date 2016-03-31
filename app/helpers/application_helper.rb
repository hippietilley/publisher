module ApplicationHelper
  def post_or_page(post)
    on_page? ? "Page" : "Post"
  end
  
  def on_admin_page?
    @on_admin_page
  end
  
  def hide?(name)
    !show?(name)
  end

  def show_site_nav?
    # hide site if there are no user or no posts
    # TODO: change to Post.count.zero? when Post is implemented
    !(Article.count + Event.count + Note.count + Photo.count + Bookmark.count + Sound.count + Video.count).zero? ||
      User.count.zero?
  end

  def show?(name)
    if setting(name).blank?
      false
    else
      true
    end
  end

  def show_nav_to?(page)
    case page
    when :home
      if (hide?(:header_show_avatar) && hide?(:header_show_site_title)) ||
         (setting(:site_title).blank? && @owner && @owner.avatar.blank?)
        true
      end
    else
      Post.of(page.to_s.singularize.capitalize).visible.count > 0
    end
  end

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
    output.flatten.join(format == :html ? " " : "\n\t").html_safe
  end

  def license_name_and_url(format = nil)
    license = License.find(setting :license)

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
    title << (on_admin_page? ? "Admin: " : "#{setting(:site_title)} - ")
    title << @page_title if @page_title
    title
  end

  def page_description
    if in_a_list?
      # TODO: implement #post_type: notes, articles, photes, etc
      "Posts by #{@owner.try(:name)}"
    elsif on_permalink? && @post
      truncate(Nokogiri::HTML(@post.content).text, length: 500)
    else
      setting(:site_description)
    end
  end

  def apple_touch_icon_link_tags
    output = []

    # square pixel sizes
    sizes = [57, 60, 72, 76, 114, 120, 144, 152, 180]
    sizes.each do |size|
      dimensions = "#{size}x#{size}"
      href = setting("touch_icon_url_#{dimensions}")
      output << tag(:link, rel: "apple-touch-icon", sizes: dimensions, href: href)
    end

    output.join("\n").html_safe
  end
  
  def blank
    ""
  end

  def show_action?
    action_name == "show"
  end

  def datetime_select_value(thing, attr, unit_of_time, include_blank)
    datetime = thing.send(attr).try(unit_of_time)
    
    if datetime.blank? && include_blank.present?
      nil
    else
      Time.now.send(unit_of_time)
    end
  end

  def lorem_ipsum
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
end
