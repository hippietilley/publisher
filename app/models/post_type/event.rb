class Event < PostType
  fallback_attr :title

  def location
    pieces = []

    pieces << location_street_address           unless location_street_address.blank?
    pieces << location_extended_street_address  unless location_extended_street_address.blank?
    pieces << location_locality                 unless location_locality.blank?
    pieces << location_region                   unless location_region.blank?
    pieces << location_country                  unless location_country.blank?
    pieces << location_postal_code              unless location_postal_code.blank?

    pieces.join(", ")
  end
end
