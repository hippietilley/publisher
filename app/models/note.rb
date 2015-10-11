class Note < ActiveRecord::Base
  before_create :set_slug
  before_update :set_slug
  
  def public?
    !self.private?
  end
  
  def title
    content
  end
  
  private
  
  def set_slug
    if self.slug.blank?
      self.slug = self.title.gsub(/\'|\"/, "").parameterize
    end
  end
end
