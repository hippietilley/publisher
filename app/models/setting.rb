class Setting < ActiveRecord::Base
  validates :name,    presence: true
  validates :content, presence: true

  default_scope { order(:name) }
  scope :editable, -> { where(editable: true) }

  before_create :set_key
  before_update :set_key

  private

  def set_key
    self.key = name.downcase.gsub(/\W/, "_").gsub(/__/, "_").gsub(/(^_|_$)/, "")
  end
end
