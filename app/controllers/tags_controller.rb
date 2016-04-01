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
    if params[:id] =~ /:/
      namespace, remainder = params[:id].split(":")
      predicate, slug = remainder.split("=")
      @tag = Tag.find_by(namespace: namespace, predicate: predicate, slug: slug)
    else
      @tag = Tag.find_by(slug: params[:id])
    end
    
    return redirect_to(tags_path) unless @tag.public_tag? || signed_in?
  end
end
