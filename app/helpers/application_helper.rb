module ApplicationHelper
  include Webpacker::Helper

  def character_image(person)
    image_url = person.image_url

    return image_tag(image_url, class: "card-img", height: "500") if image_url.present?

    image_pack_tag("unknown_character.png", class: "card-img", height: "500")
  end
end
