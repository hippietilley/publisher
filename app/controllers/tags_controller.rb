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

  def show
    if params[:slug] =~ /:/
      namespace, remainder = params[:slug].split(":")
      predicate, slug = remainder.split("=")
      @tag = Tag.find_by(namespace: namespace, predicate: predicate, slug: slug)
    else
      @tag = Tag.find_by(slug: params[:slug])
    end
    
    return redirect_to(root_path) if @tag.private_tag? && !signed_in?
  end
end
