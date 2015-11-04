class TagsController < ApplicationController
  def index
    @tags = []

    Tag.all.each do |tag|
      if signed_in?
        @tags << tag
      elsif !tag.private_tag?
        @tags << tag
      end
    end

    @tags.sort_by! { |tag| tag.name.downcase }
  end
end
