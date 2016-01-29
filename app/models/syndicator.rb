module Syndicator

  def self.for(service)
    "Syndicator::#{service.to_s.camelcase}".constantize.new
  end

end
