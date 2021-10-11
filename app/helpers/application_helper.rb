module ApplicationHelper
  include Webpacker::Helper

  def character_image(person)
    return image_tag(person.image_url, class: "card-img", height: "500") if person.image_url.present?

    image_pack_tag("unknown_character.png", class: "card-img", height: "500")
  end
end
