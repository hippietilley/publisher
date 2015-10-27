module EventsHelper
  def link_to_location(event)
    url = "http://www.openstreetmap.org/search?query=#{event.location}"
    html = []

    html << content_tag(:span, event.location_street_address,          class: "p-street-address")          unless event.location_street_address.blank?
    html << content_tag(:span, event.location_extended_street_address, class: "p-extended-street-address") unless event.location_extended_street_address.blank?
    html << content_tag(:span, event.location_locality,                class: "p-locality")                unless event.location_locality.blank?
    html << content_tag(:span, event.location_region,                  class: "p-region")                  unless event.location_region.blank?
    html << content_tag(:span, event.location_country,                 class: "p-country")                 unless event.location_country.blank?
    html << content_tag(:span, event.location_postal_code,             class: "p-postal-code")             unless event.location_postal_code.blank?

    link_to html.join(", ").html_safe, url, title: "#{event.location} on Open Stree Maps"
  end
end
