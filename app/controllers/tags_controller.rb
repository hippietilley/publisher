class TagsController < ApplicationController
  def index
    @tags = []

    Tag.all.each do |tag|
      if signed_in?
        @tags << tag
      elsif tag.public_tag?
        @tags << tag
      end
    end

    @tags.sort_by! { |tag| tag.name.downcase }
  end

  def show
    @tag = Tag.find_by(slug: params[:id])

    if @tag.blank? || (@tag.private_tag? && !signed_in?)
      return redirect_to(tags_path)
    end
  end
end
