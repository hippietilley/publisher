class License < ActiveRecord::Base

  class << self
    def options_for_select
      License.all.map{ |l| ["#{l.name} (#{l.short_code})", l.id] }
    end
  end

end
